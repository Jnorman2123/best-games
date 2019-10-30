class BestGames::Game
  attr_accessor :title, :release_date, :summary, :platform, :url
  @@all = []

  def initialize(title, release_date, summary, platform, url)
    @title = title
    @release_date = release_date
    @summary = summary
    @platform = platform
    @url = url
    @@all << self
  end

  def self.games
    @@all.each do |game|
      puts "#{game.title}"
    end
    # binding.pry
  end
end
