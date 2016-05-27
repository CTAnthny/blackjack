require_relative "deck"
require_relative "hand"

puts "Welcome to Blackjack!"

deck = Deck.new
player = Hand.new
computer = Hand.new

player.cards << deck.deal(1)
puts "Player was dealt #{player.cards[0].rank}#{player.cards[0].suit}"
player.cards << deck.deal(1)
puts "Player was dealt #{player.cards[1].rank}#{player.cards[1].suit}"
puts "\nPlayer score: #{player.calculate_hand}"

while player.hand_sum < 21
  puts "\nHit or stand (H/S): "
  answer = gets.downcase.chomp
  p answer

  if answer == "h"
    player.cards << deck.deal(1)
    puts "\nPlayer was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
    puts "Player score: #{player.calculate_hand}"
    if player.hand_sum > 21
      puts "\nBust! You lose..."
      exit
    end
  elsif answer == "s"
    puts "\nPlayer stands."
    break
  else
    puts "\nInvalid input! Please enter H or S."
  end
end

computer.cards << deck.deal(1)
puts "\nDealer was dealt #{computer.cards[0].rank}#{computer.cards[0].suit}"
computer.cards << deck.deal(1)
puts "Dealer was dealt #{computer.cards[1].rank}#{computer.cards[1].suit}"
puts "\nDealer score: #{computer.calculate_hand}"

if computer.hand_sum > 17 && computer.hand_sum < 21
  puts "\nDealer stands."
else
  while computer.hand_sum < 17
    puts "\nHit or stand (H/S): "
    p "h"

    computer.cards << deck.deal(1)
    puts "\nDealer was dealt #{computer.cards[-1].rank}#{computer.cards[-1].suit}"
    puts "\nDealer score: #{computer.calculate_hand}"
    if computer.hand_sum > 21
      puts "\nBust! Dealer loses..."
      exit
    elsif computer.hand_sum >= 17
      puts "\nDealer stands."
      break
    end
  end
end

if player.hand_sum > computer.hand_sum
  puts "\nYou win!"
elsif player.hand_sum < computer.hand_sum
  puts "\nDealer wins!"
else
  puts "\nTie!"
end
