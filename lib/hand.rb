class Hand
  attr_reader :hand, :player_name

  def initialize (player_name)
    @player_name = player_name
    @hand = []
  end

  def add_to_hand(card)
    @hand << card
  end

  def determine_score
    hand_count = 0
    contains_ace = []

    hand.each do |temp_card|
      if temp_card.face_card?
        hand_count += 10
      elsif temp_card.ace?
          contains_ace << "yes"
      else
        hand_count += temp_card.rank.to_i
      end
    end

    if contains_ace != []
      contains_ace.each do |ace|
        if (hand_count + 11) > 21
          hand_count += 1
        else
          hand_count += 11
        end
      end
    end
    hand_count
  end
end
