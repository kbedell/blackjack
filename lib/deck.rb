class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  def initialize
    @deck = []
  end

  def build_deck
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck << Card.new("#{rank}","#{suit}")
      end
    end
    @deck.shuffle!
  end

  def draw!(number)
    @deck.pop(number)
  end
end
