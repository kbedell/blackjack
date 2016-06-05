require "spec_helper"

RSpec.describe Hand do

  let (:hand) { Hand.new("player") }

  describe "#determine_score" do
    it "returns a score of 20" do
      card_1 = Card.new("J", "♥")
      card_2 = Card.new("10", "♥")
      hand.add_to_hand(card_1)
      hand.add_to_hand(card_2)

      expect(hand.determine_score).to eq (20)
    end

    it "returns a score of 21" do
      card_1 = Card.new("A", "♥")
      card_2 = Card.new("K", "♥")
      hand.add_to_hand(card_1)
      hand.add_to_hand(card_2)

      expect(hand.determine_score).to eq (21)
    end

    it "returns a score of 15" do
      card_1 = Card.new("3", "♥")
      card_2 = Card.new("A", "♥")
      card_3 = Card.new("A", "♥")
      hand.add_to_hand(card_1)
      hand.add_to_hand(card_2)
      hand.add_to_hand(card_3)

      expect(hand.determine_score).to eq (15)
    end
  end

  describe "#add_to_hand" do
    it "Confirms that the hand array is not empty" do
      card_1 = Card.new("J", "♥")
      expect(hand.add_to_hand(card_1)).not_to eq([])
    end
  end
end
