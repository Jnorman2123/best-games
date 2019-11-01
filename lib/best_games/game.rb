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
    binding.pry
  end

  def release_date
    release_date = doc.search("dd li span").text.gsub(/unreleased|released|\D \d more/, "")
  end

  def doc
    @doc = Nokogiri::HTML(open(@url))
  end
end
