class Card
  attr_reader :rank, :suit

  def initialize (rank, suit)
    @rank, @suit = rank, suit
  end

  def face_card?
    rank == 'J' || rank == 'Q' || rank == 'K'
  end

  def ace?
    rank == 'A'
  end
end
