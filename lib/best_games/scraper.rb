class BestGames::Scraper

  def self.game_titles
    doc = Nokogiri::HTML(open("https://www.gamespot.com/"))
    doc.search("div.game-item").each.with_index(1) do |game, index|
      link = game.search("a").attribute("href").value
      title = game.search("a h4.game-title").text.strip
      puts ("#{index}. #{title}")
      # binding.pry
    end
  end

  def self.game_attributes
    doc = Nokogiri::HTML(open("https://www.gamespot.com/final-fantasy-vii-remake/"))
    doc2 =  Nokogiri::HTML(open("https://www.gamespot.com/"))
    title = doc2.search("div.game-item a h4")[0].text.strip
    release_date = doc.search("dd.pod-objectStats-info__release li span").text.strip.gsub(/unreleased/, "")
    summary = doc.search("dd.pod-objectStats-info__deck").text.strip
    platform = doc.search("dd.pod-objectStats-info__systems ul.system-list li").text.strip
    url = doc2.search("div.game-item a").attribute("href").value
    # puts "#{title}"
    # puts "Coming #{release_date}!"
    # puts "#{platform}"
    # puts "#{summary}"
    # puts "#{url}"
    zelda = BestGames::Game.new(title, release_date, summary, platform, url)
    puts "#{zelda.url}"
  end

end
