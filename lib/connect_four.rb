# Connect four game implementation
class ConnectFour
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def lowest_possible_positions
    @board.each_with_object([]).with_index do |(row, possible_positions), row_index|
      7.times do |column_index|
        possible_positions[column_index] = [row_index, column_index] if row[column_index].nil?
      end
    end
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
