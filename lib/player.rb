# Connect Four player implementation
class Player
  attr_reader :player_number, :plays, :sym

  def initialize(player_number)
    @sym = player_number == 1 ? "\e[31m\u26AB\e[0m" : "\e[34m\u26AB\e[0m"
    @player_number = player_number
    @plays = []
  end

  def make_a_play(possible_positions)
    loop do
      print "Player #{@player_number}, select a column to place your piece.\n>> "
      desired_column = gets.chomp.to_i
      # rubocop:disable Style
      if desired_column.between?(1, 7) && possible_positions[desired_column - 1]
        break possible_positions[desired_column - 1]
      else
        puts "Oops! You've entered a invalid input or a unavailable column.\n\n"
      end
      # rubocop:enable Style
    end
  end
end
