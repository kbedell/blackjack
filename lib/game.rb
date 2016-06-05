require 'pry'
class Game
  def initialize
    Game.play_game
  end

  private
  def self.play_game
    puts "Welcome to Blacjack"
    create_deck
    initialize_hands
    score_hands
    puts "Player Score: #{@player_score}"
    dealer_adjustments
    if @dealer_score > 21
      puts "You've won. The Dealer went bust with #{@dealer_score}."
    else
      player_turn
      final_score
    end
  end

  def self.create_deck
    @deck = Deck.new
    @deck.build_deck
  end

  def self.deal_hand(hand)
    cards = @deck.draw!(2)
    cards.each do |card|
      puts "#{hand.player_name} was dealt #{card.rank}#{card.suit}"
      hand.add_to_hand(card)
    end
  end

  def self.initialize_hands
    @player_hand = Hand.new("Player")
    @dealer_hand = Hand.new("Dealer")

    deal_hand(@player_hand)
    deal_hand(@dealer_hand)
  end

  def self.score_hands
    @player_score = @player_hand.determine_score
    @dealer_score = @dealer_hand.determine_score
  end

  def self.dealer_adjustments
    while @dealer_score <= 17
      cards = @deck.draw!(1)
      cards.each do |card|
        @dealer_hand.add_to_hand(card)
      end
      @dealer_score = @dealer_hand.determine_score
    end
  end

  def self.player_turn
    answer = gets_player_command
    while !valid_input?(answer)
      puts "Please enter (H)it or (S)tand."
      answer = gets_player_command
    end

    while answer == "H" && @player_score < 21
      hit
      score_hands
      puts "Your score is #{@player_score}"
      answer = gets_player_command
    end
  end

  def self.valid_input?(input)
    input = "H" || input == "S"
  end

  def self.gets_player_command
    puts "Would you like to (H)it or (S)tand?"
    response = STDIN.gets.chomp
    response.upcase
  end

  def self.hit
    card = @deck.draw!(1)
    @player_hand.add_to_hand(card)
    puts "Player was dealt #{card.rank}#{card.suit}."
  end

  def self.final_score
    if @player_score > 21
      puts "You lost because you went bust!"
    elsif @player_score < @dealer_score
      puts "You lost because your score was #{@player_score} versus the dealer's #{@dealer_score}."
    else
      puts "You won because your score was #{@player_score} versus the dealer's #{@dealer_score}."
    end
  end
end
