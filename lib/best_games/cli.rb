class BestGames::CLI

  def call
    list_games
  end

  def list_games
    puts "These are the top upcoming games:"
    puts "---------------------------------"
    BestGames::Scraper.create_game
    BestGames::Game.games.each do |game|
      puts "#{game.rank}. #{game.title}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number that you would like to see more details about, or list to see the list again or exit:"
      input = gets.strip.downcase
      if input >= "1" || input <= "10"
        BestGames::Game.call_attributes(input.to_i - 1)
      elsif input == "list"
        list_games
      end
    end
  end
end
