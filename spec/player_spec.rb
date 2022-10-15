require_relative "../lib/player"

# rubocop:disable Metrics
describe Player do
  subject(:player) { described_class.new(1) }

  before do
    allow(player).to receive(:print)
    allow(player).to receive(:puts)
    @error_message = "Oops! You've entered a invalid input or a unavailable column.\n\n"
  end

  describe "#make_a_play" do
    context "when all columns are available to place" do
      let(:possible_positions) { [[5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6]] }

      it "returns [5, 4] when selecting the fifth column" do
        allow(player).to receive(:gets).and_return('5')
        result = player.make_a_play(possible_positions)
        expect(result).to eq([5, 4])
      end

      it "returns [5, 1] when selecting the second column" do
        allow(player).to receive(:gets).and_return('2')
        result = player.make_a_play(possible_positions)
        expect(result).to eq([5, 1])
      end
    end

    context "when a row is full of player pieces" do
      let(:possible_positions) { [[4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6]] }

      it "returns [4, 5] when selecting the sixth column" do
        allow(player).to receive(:gets).and_return('6')
        result = player.make_a_play(possible_positions)
        expect(result).to eq([4, 5])
      end

      it "returns [4, 3] when selecting the fourth column" do
        allow(player).to receive(:gets).and_return('4')
        result = player.make_a_play(possible_positions)
        expect(result).to eq([4, 3])
      end
    end

    context "when a column is full of player pieces" do
      let(:possible_positions) { [[5, 0], nil, [5, 2], [5, 3], [5, 4], [5, 5], [5, 6]] }

      it "shows error message once after selecting the already full column" do
        allow(player).to receive(:gets).and_return('2', '3')
        expect(player).to receive(:puts).with(@error_message).once
        player.make_a_play(possible_positions)
      end
    end

    context "when the player send invalid inputs" do
      let(:possible_positions) { [[5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6]] }

      it "shows error message once after a invalid input" do
        allow(player).to receive(:gets).and_return('8', '3')
        expect(player).to receive(:puts).with(@error_message).once
        player.make_a_play(possible_positions)
      end

      it "shows error message twice after two invalid inputs" do
        allow(player).to receive(:gets).and_return('r', '10', '5')
        expect(player).to receive(:puts).with(@error_message).twice
        player.make_a_play(possible_positions)
      end
    end
  end
end
# rubocop:enable Metrics
