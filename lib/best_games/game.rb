class BestGames::Game
  attr_accessor :title, :release_date, :summary, :platform, :url, :developer, :publisher, :genre, :rank
  @@all = []

  def initialize(rank, title, url)
    @title = title
    @rank = rank
    @url = url
    @@all << self
  end

  def self.games
    @@all
  end

  def self.find_by_rank(num)
    self.games.find do |game|
      game.rank == num
    end
  end

  def release_date
    @release_date = doc.search("dd li span").text.gsub(/unreleased|released|\D \d more/, "")
  end

  def summary
    @summary = doc.search("dd.pod-objectStats-info__deck").text
  end

  def platform
    platforms = []
    @platform = doc.search("dd ul li")
    @platform.each do |console|
      text = console.text.gsub(/\D \d more/, "")
      platforms << text
    end
    platforms.join(", ")
  end

  def developer
    developers = []
    @developer = doc.search("dl.pod-objectStats-additional dd")
    @developer.each do |property|
      developers << property.text
    end
    developers[0]
  end

  def publisher
    publishers = []
    @publisher = doc.search("dl.pod-objectStats-additional dd")
    @publisher.each do |property|
      publishers << property.text
    end
    publishers[1]
  end

  def genre
    genres = []
    @genre = doc.search("dl.pod-objectStats-additional dd")
    @genre.each do |property|
      genres << property.text
    end
    genres[2]
  end

  def doc
    @doc = Nokogiri::HTML(open(@url))
  end
end
