require 'pry'

class Card
  SUITS  = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def points
    if value >= '2' && value <= '9'
      val = value.to_i
    elsif value == 'Ace'
      val = 11
    else
      val = 10
    end
    val
  end

  def to_s
    "The #{value} of #{suit}"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    create
  end

  def create
    cards = []
    Card::SUITS.each do |s|
      Card::VALUES.each do |v|
        @cards << Card.new(s, v)
      end
    end
    shuffle!
  end

  def shuffle!
    cards.shuffle!
  end

  def deal(number)
    cards.pop(number)
  end

  def size
    cards.size
  end

  def pop
    cards.pop
  end
end

class Participant
  attr_accessor :hand

  # def hand
  #   @hand
  # end

  # def hand=(h)
  #   @hand = hand
  # end

  def initialize
    @hand = []
  end

  def hand_score
    score = 0
    hand.each do |card|
      score += card.points
    end
    aces = (hand.each.select { |card| card.value == 'Ace' }).count
    aces.times do
      score -= 10 if score > 21
    end
    score
  end

  def busted?
    hand_score > 21
  end

  def show_hand(num)
    count = 0
    num = hand.size if num == 0
    while count < num
      puts hand[count]
      count += 1
    end
  end

  def hit(card)
    hand << card
  end
end

class Player < Participant
  def show_hand(num=0)
    puts "Your cards:"
    super
  end

  def draw_cards(deck)
    loop do
      puts ""
      puts "Do you want to hit or stay?"
      choice = gets.chomp.downcase
      break if choice.start_with? 's'
      @hand += [deck.pop]
      show_hand
      val = hand_score
      puts "Player hand value: #{val}"
      if val > 21
        puts "Player busts!"
        return
      end
    end
  end
end

class Dealer < Participant
  def show_hand(num)
    puts "\nDealer's cards:"
    super
  end

  def draw_cards(deck)
    puts "\nDealer is drawing cards ..."
    while hand_score < 17
      @hand += [deck.pop]
      puts "... #{@hand.last}"
    end
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def decide_winner(player_score, dealer_score)
    if dealer_score > 21
      return 'Player'
    elsif player_score > dealer_score
      return 'Player'
    elsif dealer_score > player_score
      return "Dealer"
    else
      return "Tie"
    end
  end

  def play_again?
    puts "Do you want to play again?"
    ans = ''
    loop do
      ans = gets.chomp.downcase
      break if ['y', 'n'].include? ans
    end
    ans == 'y'
  end

  def setup
    system 'clear'
    puts "Welcome to Twenty One, Object Oriented style!"
  end

  def first_round
    player.hand = deck.deal(2)
    dealer.hand = deck.deal(2)
    player.show_hand(2)
    puts ""
    dealer.show_hand(1)
  end

  def handle_winner
    puts "\nScores: Player: #{player.hand_score}, Dealer: #{dealer.hand_score}"
    winner = decide_winner(player.hand_score, dealer.hand_score)
    puts "#{winner} wins!" if winner != "Tie"
    puts "#{winner}!" if winner == "Tie"
  end

  def run
    setup
    loop do
      deck.create
      first_round
      player.draw_cards(deck)
      if player.busted? && play_again?
        system 'clear'
        next
      elsif player.busted?
        break
      end
      dealer.show_hand(0)
      dealer.draw_cards(deck)
      handle_winner
      break unless play_again?
      system 'clear'
    end
    puts "\n Thanks for playing Twenty One, Object Oriented Style!"
  end
end

game = Game.new
game.run
