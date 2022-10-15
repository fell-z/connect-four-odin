# Connect four game implementation
class ConnectFour
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  # rubocop:disable Style/StringConcatenation
  def render
    system("clear")
    puts "\u256D#{"\u2500" * 15}\u256E"
    @board.each do |row|
      puts row.reduce("\u2502 ") { |str, column_el| str + (column_el || "\u26AA") } + "\u2502"
    end
    puts "\u2570#{"\u2500" * 15}\u256F"
  end
  # rubocop:enable Style/StringConcatenation
end
