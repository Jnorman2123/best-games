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
      if input.to_i > 0 && input.to_i <= 50
        game = BestGames::Game.find_by_rank(input)
        game_details(game)
      elsif input == "list"
        list_games
      elsif input == "exit"
        puts "Goodbye"
      else
        puts ""
        puts "I don't recognize that input."
      end
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
    puts "Published by #{game.publisher}."
    puts "Genres #{game.genre}"
  end
end
