require "json"

# Connect four game implementation
class ConnectFour
  VALID_SEQUENCES = JSON.load_file("lib/valid_combinations.json")

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

  def game_over?(player)
    VALID_SEQUENCES.one? do |valid_sequence|
      valid_sequence.intersection(player.plays.sort) == valid_sequence
    end
  end

  # rubocop:disable Style/StringConcatenation
  def render
    system("clear")
    puts "  1 2 3 4 5 6 7"
    puts "\u256D#{"\u2500" * 15}\u256E"
    @board.each do |row|
      puts row.reduce("\u2502 ") { |str, column_el| str + (column_el || "\u26AA") } + "\u2502"
    end
    puts "\u2570#{"\u2500" * 15}\u256F"
  end
  # rubocop:enable Style/StringConcatenation

  private

  def update_board(player, position)
    @board[position[0]][position[1]] = player.sym
  end
end
