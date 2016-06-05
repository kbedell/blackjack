require "spec_helper"

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.build_deck.size).to eq (52)
    end

    it "creates unique cards" do
      expect(deck.build_deck.uniq.size).to eq (52)
    end
  end
end
