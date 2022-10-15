require_relative "../lib/connect_four"

# rubocop:disable Metrics
describe ConnectFour do
  subject(:game) { described_class.new }

  describe "#lowest_possible_positions" do
    context "when the board is empty of player pieces" do
      it "returns an array with locations in all columns and at the first row" do
        expected = [[5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6]]
        result = game.lowest_possible_positions
        expect(result).to eq(expected)
      end
    end

    context "when the first row is full and the second row is almost full of player pieces" do
      before do
        test_board = Array.new(6) { Array.new(7) { nil } }
        test_board[5].map!.with_index { |_column, index| index }
        test_board[4][1] = 1
        test_board[4][2] = 2
        test_board[4][5] = 5

        game.instance_variable_set(:@board, test_board)
      end

      it "returns an array with locations down to the second and third row" do
        expected = [[4, 0], [3, 1], [3, 2], [4, 3], [4, 4], [3, 5], [4, 6]]
        result = game.lowest_possible_positions
        expect(result).to eq(expected)
      end
    end

    context "when a column is full" do
      before do
        test_board = Array.new(6) { Array.new(7) { nil } }
        6.times { |row_index| test_board[row_index][0] = row_index }

        game.instance_variable_set(:@board, test_board)
      end

      it "returns an array with only the columns possible to place" do
        result = game.lowest_possible_positions
        expect(result[0]).to be_nil
      end
    end
  end
end
# rubocop:enable Metrics
