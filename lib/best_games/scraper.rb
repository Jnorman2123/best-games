class BestGames::Scraper

  def self.doc
    doc = Nokogiri::HTML(open("https://www.gamespot.com/gamespot-50/"))
  end

  def self.create_game
    self.doc.search("li.media").each.with_index(1) do |game, index|
      next if index == 2
      url_suffix = game.search("figure a").attribute("href")
      url = "https://www.gamespot.com#{url_suffix}"
      rank = game.search("figure a span span.gs50-item__rank__value").text.strip
      title = game.search("div h3 a").text
      BestGames::Game.new(rank, title, url)
    end
  end

  def self.scrape_game_details(game)
    doc = Nokogiri::HTML(open(game.url))
    game.release_date = doc.search("dd li span").text.gsub(/unreleased|released|\D \d more/, "")
    game.summary = doc.search("dd.pod-objectStats-info__deck").text
    platforms = []
    doc.search("dd ul li").each do |console|
      platforms << console.text
    end
    platforms.delete("+ 2 more")
    platforms.delete("+ 3 more")
    game.platform = platforms.join(", ")
    properties = []
    doc.search("dl.pod-objectStats-additional dd").each do |property|
      properties << property.text
    end
    game.developer = properties[0]
    game.publisher = properties[1]
    game.genre = properties[2]
  end
end
