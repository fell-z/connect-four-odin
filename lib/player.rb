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
      desired_column = gets.chomp.to_i - 1
      if desired_column.between?(1, 7) && possible_positions[desired_column]
        @plays << possible_positions[desired_column]
        break possible_positions[desired_column]
      else
        puts "Oops! You've entered a invalid input or a unavailable column.\n\n"
      end
    end
  end
end
