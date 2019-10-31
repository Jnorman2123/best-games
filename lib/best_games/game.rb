class BestGames::Game
  attr_accessor :title, :release_date, :summary, :platform, :url, :developer, :publisher, :genre, :rank
  @@all = []

  def initialize(title, rank, url)
    @title = title
    @rank = rank
    @url = url
    @@all << self
  end

  def self.games
    @@all
    binding.pry
  end

  def self.create
    self.new(BestGames::Scraper.scrape_title, BestGames::Scraper.scrape_rank, BestGames::Scraper.scrape_url)
  end

end
