class BestGames::CLI

  def call
    puts "These are the top upcoming games:"
    puts "---------------------------------"
    list_games
    # menu
    BestGames::Scraper.game_attributes
  end

  def list_games
    BestGames::Scraper.game_titles
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number that you would like to see more details about, or list to see the list again or exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Here is more info on The Legend of Zelda: Ocarina of Time"
      when "2"
        puts "Here is more info on Tony Hawk's Pro Skater 2"
      when "3"
        puts "Here is more info on Grand Theft Auto IV"
      when "4"
        puts "Here is more info on SoulCalibur"
      when "5"
        puts "Here is more info on Super Mario Galaxy"
      when "list"
        list_games
      else
        puts "Invalid input, please enter valid number, list, or exit"
      end
    end
  end
end
