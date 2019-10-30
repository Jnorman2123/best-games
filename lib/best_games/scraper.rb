class BestGames::Scraper

  def self.scrape
    doc = Nokogiri::HTML(open("https://www.gamespot.com/"))
    doc.search("div.game-item").each.with_index(1) do |game, index|
      # link = game.search("a").attribute("href").value
      title = game.search("a h4.game-title").text.strip
      puts ("#{index}. #{title}")
      # binding.pry
    end
  end

end
