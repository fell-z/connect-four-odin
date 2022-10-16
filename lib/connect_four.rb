require "json"
require_relative "./player"

# Connect four game implementation
class ConnectFour
  VALID_SEQUENCES = JSON.load_file("lib/valid_combinations.json")

  def initialize(player_one = Player.new(1), player_two = Player.new(2))
    @board = Array.new(6) { Array.new(7) }
    @player_one = player_one
    @player_two = player_two
  end

  def start
    welcome_message
    [@player_one, @player_two].each do |player|
      render

      start_player_turn(player)
      if game_over?(player)
        congrats_message(player)
        break
      end
    end until game_over?(@player_one) || game_over?(@player_two)
  end

  def start_player_turn(player)
    position = player.make_a_play(lowest_possible_positions)
    update_board(player, position)
  end

  def lowest_possible_positions
    @board.each_with_object([]).with_index do |(row, possible_positions), row_index|
      7.times do |column_index|
        possible_positions[column_index] = [row_index, column_index] if row[column_index].nil?
      end
    end
  end

  def game_over?(player)
    VALID_SEQUENCES.any? do |valid_sequence|
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

  def welcome_message
    puts <<~WELCOME
      Welcome to a game of Connect Four!

      The objective of this game is simple, just make a sequence of four pieces in a row,
      that row can be a horizontal, vertical or a diagonal sequence, traditional rules!

      Player one will be identified as the red pieces.
      Player two will be identified as the blue pieces.

      Good luck!
    WELCOME
    sleep(6)
  end

  def congrats_message(player)
    puts "Congratulations Player #{player.player_number}, you've won!"
  end
end
