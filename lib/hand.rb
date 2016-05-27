class Hand
  attr_reader :cards, :hand_sum

  def initialize(cards = [])
    @cards = cards
  end

  def calculate_hand
    @hand_sum = 0
    @cards.each do |card|
      if card.rank.match(/(\d{1,2})/)
        @hand_sum += $1.to_i
      elsif card.rank.match(/(J|Q|K)/)
        @hand_sum += 10
      elsif card.rank.match(/A/) && hand_sum <= 10
        @hand_sum += 11
      elsif card.rank.match(/A/) && hand_sum >= 11
        @hand_sum += 1
      end
    end
    @hand_sum
  end
end
