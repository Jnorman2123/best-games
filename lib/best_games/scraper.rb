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
    game.platform = doc.search("dd ul li")[0].text
    # game.platform.each do |console|
    #   console
    #   .gsub(/\D \d more/, "")
    #   platforms << text
    # end
    platforms.join(", ")
    properties = []
    doc.search("dl.pod-objectStats-additional dd").each do |property|
      properties << property.text
    end
    game.developer = properties[0]
    game.publisher = properties[1]
    game.genre = properties[2]
  end

#   def release_date
#     @release_date ||= doc.search("dd li span").text.gsub(/unreleased|released|\D \d more/, "")
#   end
#
#   def summary
#     @summary ||= doc.search("dd.pod-objectStats-info__deck").text
#   end
#
#   def platform
#     platforms = []
#     @platform ||= doc.search("dd ul li")
#     @platform.each do |console|
#       text = console.text.gsub(/\D \d more/, "")
#       platforms << text
#     end
#     platforms.join(", ")
#   end
#
#   def developer
#     developers = []
#     @developer ||= doc.search("dl.pod-objectStats-additional dd")
#     @developer.each do |property|
#       developers << property.text
#     end
#     developers[0]
#   end
#
#   def publisher
#     publishers = []
#     @publisher ||= doc.search("dl.pod-objectStats-additional dd")
#     @publisher.each do |property|
#       publishers << property.text
#     end
#     publishers[1]
#   end
#
#   def genre
#     genres = []
#     @genre ||= doc.search("dl.pod-objectStats-additional dd")
#     @genre.each do |property|
#       genres << property.text
#     end
#     genres[2]
#   end
#
#   def doc
#     @doc = Nokogiri::HTML(open(@url))
#   end
end
