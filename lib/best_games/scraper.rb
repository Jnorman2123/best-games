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
end
