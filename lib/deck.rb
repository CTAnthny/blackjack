require_relative "card"

class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = []
    build_deck
  end

  def build_deck
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank.to_s, suit)
      end
    end
    @cards.shuffle!
  end

  def deal(num)
    returned_card = @cards.pop(num)
    returned_card[0]
  end
end
