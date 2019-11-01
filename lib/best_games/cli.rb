class BestGames::CLI

  def call
    BestGames::Scraper.create_game
    list_games
    menu
  end

  def list_games
    puts "These are the top upcoming games:"
    puts "---------------------------------"
    BestGames::Game.games.each do |game|
      puts "#{game.rank}. #{game.title}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number that you would like to see more details about, or list to see the list again or exit to leave:"
      input = gets.strip.downcase
      game = BestGames::Game.find_by_rank(input)
      game_details(game)
    end
  end

  def game_details(game)
    puts "Here are more details about the game you selected."
    puts "--------------------------------------------------"
    puts "#{game.title}"
    puts "It is the number #{game.rank} most anticipated game."
    puts "#{game.url}"
    puts "It is set to be released #{game.release_date}."
    puts "#{game.summary}"
    puts "Available on #{game.platform}."
    puts "Developed by #{game.developer}."
  end
end
