require_relative "../lib/connect_four"

describe ConnectFour do
  describe "#lowest_possible_rows" do
    subject(:game) { described_class.new }

    context "when the board is empty of player pieces" do
      it "returns an array with locations in all columns and at the first row" do
        expected = [[5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6]]
        result = game.lowest_possible_rows
        expect(result).to eq(expected)
      end
    end
  end
end
