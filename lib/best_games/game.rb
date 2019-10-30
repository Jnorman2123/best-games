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
    @@all
  end

  def self.call_attributes(index)
    puts  "#{@@all[index].title}"
    puts  "#{@@all[index].release_date}"
    @@all[index].platform.each do |system|
      puts "#{system.text}"
    end
    puts  "#{@@all[index].summary}"
    puts  "#{@@all[index].url}"
  end
end
