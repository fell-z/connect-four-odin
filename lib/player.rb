# Connect Four player implementation
class Player
  attr_reader :plays, :sym

  def initialize(player_number)
    @sym = player_number == 1 ? "\e[31m\u26AB\e[0m" : "\e[34m\u26AB\e[0m"
    @plays = []
  end
end
