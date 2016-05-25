require_relative "deck"
require_relative "hand"

puts "Welcome to Blackjack!"

deck = Deck.new
player = Hand.new
computer = Hand.new

player.cards << deck.deal(1)
puts "Player was dealt #{player.cards[0][0].rank}#{player.cards[0][0].suit}"
player.cards << deck.deal(1)
puts "Player was dealt #{player.cards[1][0].rank}#{player.cards[1][0].suit}"

puts "Player score: #{player.calculate_hand}"
