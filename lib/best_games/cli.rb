class BestGames::CLI

  def call
    puts "These are the top upcoming games:"
    puts "---------------------------------"
    list_games
    BestGames::Game.games
    menu
    # BestGames::Scraper.game_attributes
  end

  def list_games
    BestGames::Scraper.game_titles
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number that you would like to see more details about, or list to see the list again or exit:"
      input = gets.strip.downcase
      if input >= "1" || input <= "10"
        BestGames::Game.call_attributes(input.to_i - 1)
      end
    end
  end
end
