class BestGames::Game
  attr_accessor :title, :rating, :release_date, :summary, :list_of_awards, :genre, :platform

  def self.games
    puts "These are the highest rated games of all time:"
    puts "1. The Legend of Zelda: Ocarina of Time"
    puts "2. Tony Hawk's Pro Skater 2 "
    puts "3. Grand Theft Auto IV"
    puts "4. SoulCalibur"
    puts "5. Super Mario Galaxy"
  end
  # zelda = self.new
  # zelda.title = "The Legend of Zelda"
  # zelda.rating = "99"
  # zelda.release_date = "Nov 23, 1998"
  # zelda.summary = "Link saves Zelda from Ganondorf."
  # zelda.list_of_awards = "Best N64 game"
  # zelda.genre = "action"
  # zelda.platform = "N64"
end
