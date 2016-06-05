require "spec_helper"

RSpec.describe Card do

  let(:card_1) {Card.new("8", "♣")}
  let(:card_2) {Card.new("K", "♣")}
  let(:card_3) {Card.new("A", "♣")}

  describe "#initialize" do
    it "The creation of a card, creates a card object" do
      expect(card_1).to be_a(Card)
    end

    it "Returns the suit of ♣" do
      expect(card_1.suit).to eq("♣")
    end

    it "Returns an 8" do
      expect(card_1.rank).to eq("8")
    end
  end

  describe "#face_card?" do
    it "Returns true for the King of clubs" do
      expect(card_2.face_card?).to eq(true)
    end

    it "Returns false for the eight of clubs" do
      expect(card_1.face_card?).to eq(false)
    end
  end

  describe "#ace?" do
    it "Returns true for the Ace of clubs" do
      expect(card_3.ace?).to eq(true)
    end

    it "Returns false for the eight of clubs" do
      expect(card_1.ace?).to eq(false)
    end
  end
end
