require 'pry'

SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
VALUES = ['Ace', '2', '3', '4', '5', '6', '7', '8',
          '9', '10', 'Jack', 'Queen', 'King']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |val|
      card = [val, suit]
      deck << card
    end
  end
  deck.shuffle!
  deck
end

def deal_n_cards(deck, n=2)
  hand = []
  n.times do
    card = deck.pop
    hand += [card]
  end
  hand
end

def display_cards(hand, name="Player")
  puts "\n#{name}'s hand:"
  hand.each do |card|
    puts "#{card[0]} of #{card[1]}"
  end
end

def player_draw_cards(deck, hand)
  loop do
    puts
    prompt "Do you want to hit or stay?"
    choice = gets.chomp.downcase
    break if choice.start_with?('s')
    card = deck.pop
    hand += [card]
    display_cards(hand, "Player")
    val = hand_value(hand)
    puts "hand_value: #{val}"
    if val > 21
      return hand
    end
  end
  hand
end

def dealer_draw_cards(deck, hand)
  loop do
    break if hand_value(hand) > 17
    card = deck.pop
    hand += [card]
    display_cards(hand, "Dealer")
  end
  hand
end

def hand_value(hand)
  total = 0
  values = hand.map { |card| card[0] }
  values.each do |value|
    total += card_value(value)
  end
  (values.select { |value| value == 'Ace' }).count.times do
    total -= 10 if total > 21
  end
  total
end

def card_value(str)
  if str >= '2' && str <= '9'
    return str.to_i
  elsif str == 'Ace'
    return 11
  else
    return 10
  end
end

def decide_winner(player_val, dealer_val)
  if dealer_val > 21
    return 'Player wins'
  elsif player_val > 21
    return 'Dealer wins'
  elsif player_val > dealer_val
    return 'Player wins'
  elsif dealer_val > player_val
    return 'Dealer wins'
  else
    return 'Tie!'
  end
end

# main loop
loop do
  puts "\n\nLet's play Twenty-One!"
  deck = initialize_deck
  player_hand = deal_n_cards(deck, 2)
  dealer_hand = deal_n_cards(deck, 2)
  display_cards(player_hand, "Player")
  display_cards([dealer_hand.first], "Dealer")

  player_hand = player_draw_cards(deck, player_hand)
  player_val = hand_value(player_hand)
  dealer_hand = dealer_draw_cards(deck, dealer_hand)
  dealer_val = hand_value(dealer_hand)
  winner = decide_winner(player_val, dealer_val)
  puts "#{winner}"

  puts "\nPlay again?"
  ans = gets.chomp.downcase
  break unless ans.start_with?('y')
end
