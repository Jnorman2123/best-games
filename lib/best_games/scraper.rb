class BestGames::Scraper
  # attr_accessor :url, :title, :doc
  @@urls = []

  def self.doc
    doc = Nokogiri::HTML(open("https://www.gamespot.com/gamespot-50/"))
  end

  def self.scrape_url
    self.doc.search("li.media").each.with_index(1) do |game, index|
      next if index == 2
      url_suffix = game.search("figure a").attribute("href")
      url = "https://www.gamespot.com#{url_suffix}"
      # puts "#{url}"
      @@urls << url
    end
  end

  def self.urls
    @@urls
  end

  def self.scrape_title
    self.urls.each do |page|
      doc = Nokogiri::HTML(open(page))
      title = doc.search("div h1").text.strip
    end
  end

  def self.scrape_release_date
    self.urls.each do |page|
      doc = Nokogiri::HTML(open(page))
      date = doc.search("dd li span").text.gsub(/unreleased|released|\D \d more/, "")
    end
  end

  def self.scrape_summary
    self.urls.each do |page|
      doc = Nokogiri::HTML(open(page))
      summary = doc.search("dd.pod-objectStats-info__deck").text
    end
  end

  def self.scrape_platform
    self.urls.each do |page|
      platforms = []
      doc = Nokogiri::HTML(open(page))
      platform = doc.search("dd ul li")
      platform.each do |console|
        text = console.text.gsub(/\D \d more/, "")
        platforms << text
      end
    end
  end

  def self.scrape_developer
    self.urls.each do |page|
      developers = []
      properties = []
      doc = Nokogiri::HTML(open(page))
      property = doc.search("dl.pod-objectStats-additional dt")
      property.each do |stat|
        properties << stat.text
      end
      company = doc.search("dl.pod-objectStats-additional dd")
      company.each do |developer|
        developers << developer.text
      end
      puts "#{properties[0]} #{developers[0]}"
    end
  end

  def self.scrape_publisher
    self.urls.each do |page|
      publishers = []
      properties = []
      doc = Nokogiri::HTML(open(page))
      property = doc.search("dl.pod-objectStats-additional dt")
      property.each do |stat|
        properties << stat.text
      end
      company = doc.search("dl.pod-objectStats-additional dd")
      company.each do |publisher|
        publishers << publisher.text
      end
      puts "#{properties[1]} #{publishers[1]}"
    end
  end

  def self.scrape_genre
    self.urls.each do |page|
      genres = []
      properties = []
      doc = Nokogiri::HTML(open(page))
      property = doc.search("dl.pod-objectStats-additional dt")
      property.each do |stat|
        properties << stat.text
      end
      company = doc.search("dl.pod-objectStats-additional dd")
      company.each do |genre|
        genres << genre.text
      end
      puts "#{properties[2]} #{genres[2]}"
    end
  end
end
