class BestGames::Scraper
  attr_accessor :url, :title
  def self.game_titles
    doc = Nokogiri::HTML(open("https://www.gamespot.com/"))
    doc.search("div.game-item").each.with_index(1) do |game, index|
      @url = game.search("a").attribute("href").value
      @title = game.search("a h4.game-title").text.strip
      puts ("#{index}. #{@title}")
      self.game_attributes
    end
  end

  def self.game_attributes
    doc = Nokogiri::HTML(open("#{@url}"))
    doc2 =  Nokogiri::HTML(open("https://www.gamespot.com/"))
    release_date = doc.search("dd.pod-objectStats-info__release li span").text.strip.gsub(/unreleased/, "")
    summary = doc.search("dd.pod-objectStats-info__deck").text.strip
    platform = doc.search("dd.pod-objectStats-info__systems ul.system-list li")
    url = @url
    title = @title
    BestGames::Game.new(title, release_date, summary, platform, url)
  end

end
