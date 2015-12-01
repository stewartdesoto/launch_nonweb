require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'x'
COMPUTER_MARKER = 'o'

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delim = ',', word = 'or')
  if arr.size == 1
    return arr[0]
  elsif arr.size == 2
    return arr[0].to_s + ' ' + word + ' ' + arr[1].to_s
  else'
    str = ''
    arr.each_with_index do |element, i|
      if i == arr.size-1
        str << word + ' ' + element.to_s
      else
        str << element.to_s + delim
      end
    end
  end
  str
end

def display_board(board)
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(brd)
  winning_lines=[[1,2,3], [4,5,6], [7,8,9]] +
                [[1,4,7], [2,5,8], [3,6,9]] +
                [[1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       puts 'player'
       return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
       brd[line[1]] == COMPUTER_MARKER &&
       brd[line[2]] == COMPUTER_MARKER
        puts 'computer'
        return 'Computer'
    end   
  end
  nil

end

def empty_squares(board)
  board.keys.select{|num| board[num]==INITIAL_MARKER}
end

def board_full?(board)
  empty_squares(board).size == 0
end


def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = ' '}
  new_board
end

def player_places_piece!(board)
  square=''
  loop do
    squares_prompt = joinor(empty_squares(board), ', ', 'or')
    prompt "Choose a square: #{squares_prompt}"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER
end

# START MAIN LOOP
loop do
  board = initialize_board

  loop do 
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)  
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "Cat's game!"
  end

  prompt "play again?"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end