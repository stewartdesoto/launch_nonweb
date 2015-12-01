VALID_CHOICES = %w(rock paper scissors lizard spock)
RULES = { rock: [:lizard, :scissors],
          paper: [:rock, :spock],
          scissors: [:lizard, :paper],
          spock: [:rock, :scissors],
          lizard: [:paper, :spock]
}

def winner?(user1, user2)
  user1 if RULES[user1].include?(user2)
end

def display_results(choice, computer_choice)
  if winner?(choice.to_sym, computer_choice.to_sym)
    prompt "You win"
  elsif winner?(computer_choice.to_sym, choice.to_sym)
    prompt "Computer wins"
  else
    prompt "Tie game!"
  end
end

def prompt(message)
  Kernel.puts "=> #{message}"
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = Kernel.gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice"
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
