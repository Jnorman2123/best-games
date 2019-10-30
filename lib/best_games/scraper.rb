class BestGames::Scraper

  def self.scrape
    doc = Nokogiri::HTML(open("https://www.gamespot.com/"))
    link = doc.search("div.game-item a").attribute("href").value
    binding.pry
  end

end
