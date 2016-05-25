require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new( [Card.new("10", "♦"), Card.new("J", "♥")] ) }
  let(:face_hand) { Hand.new( [Card.new("J", "♦"), Card.new("J", "♠")] ) }
  let(:low_hand) { Hand.new( [Card.new("2", "♣"), Card.new("2", "♠")] ) }
  let(:ace_low_hand) { Hand.new( [Card.new("4", "♦"), Card.new("2", "♠"), Card.new("A", "♣")] ) }
  let(:ace_high_hand) { Hand.new( [Card.new("10", "♣"), Card.new("J", "♥"), Card.new("A", "♦")] ) }

  describe "#calculate_hand" do
    it "correctly calculates numbered cards" do
      expect(low_hand.calculate_hand).to eq(4)
    end
    it "correctly calculates two face cards" do
      expect(face_hand.calculate_hand).to eq(20)
    end
    it "correctly calculates a numbered and face card" do
      expect(hand.calculate_hand).to eq(20)
    end
    it "uses a low ace for a high hand" do
      expect(ace_low_hand.calculate_hand).to eq(17)
    end
    it "uses a high ace for a low hand" do
      expect(ace_high_hand.calculate_hand).to eq(21)
    end
  end
end
