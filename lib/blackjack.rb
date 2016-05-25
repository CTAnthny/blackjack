require 'pry'
require_relative "deck"
require_relative "hand"

puts "Welcome to Blackjack!"

deck = Deck.new
player = Hand.new
computer = Hand.new

( player.cards << deck.deal(1) ).flatten!
puts "Player was dealt #{player.cards[0].rank}#{player.cards[0].suit}"
( player.cards << deck.deal(1) ).flatten!
puts "Player was dealt #{player.cards[1].rank}#{player.cards[1].suit}"
puts "\nPlayer score: #{player.calculate_hand}"

while player.calculate_hand < 21
  puts "\nHit or stand (H/S): "
  answer = gets.downcase.chomp
  p answer

  if answer == "h"
    ( player.cards << deck.deal(1) ).flatten!
    puts "\nPlayer was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
    puts "Player score: #{player.calculate_hand}"
    if player.calculate_hand > 21
      puts "\nBust! You lose..."
      break
      exit
    end
  elsif answer == "s"
    puts "\nPlayer stands."
    ( computer.cards << deck.deal(1) ).flatten!
    puts "\nDealer was dealt #{computer.cards[0].rank}#{computer.cards[0].suit}"
    ( computer.cards << deck.deal(1) ).flatten!
    puts "Dealer was dealt #{computer.cards[1].rank}#{computer.cards[1].suit}"
    puts "\nDealer score: #{player.calculate_hand}"
    while computer.calculate_hand < 21 && computer.calculate_hand < 17
      puts "\nHit or stand (H/S): "
      p "h"
      ( computer.cards << deck.deal(1) ).flatten!
      puts "\nComputer was dealt #{computer.cards[-1].rank}#{computer.cards[-1].suit}"
      puts "\nComputer score: #{computer.calculate_hand}"
      if computer.calculate_hand > 21
        puts "\nBust! Dealer loses..."
        break
      elsif computer.calculate_hand >= 17
        puts "\nDealer stands."
        break
      end
    end
  else
    puts "\nInvalid input! Please enter H or S."
  end
end

if player.calculate_hand > computer.calculate_hand
  puts "\nYou win!"
elsif player.calculate_hand < computer.calculate_hand
  puts "\nDealer wins!"
else
  puts "Tie!"
end

binding.pry
