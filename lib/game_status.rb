
board = ["X", "O", "X", "O", "O", "O", "X", "O", ""]
WIN_COMBINATIONS = [[0,1,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
#----
def full?(board)
  full_board = true
  board.each do |i|
    if !(i == "X" || i == "O")
      full_board = false
    end
  end
  puts 'full_board = ' + full_board.to_s
  return full_board
end
#----
def draw?(board)
  #returns true if the board has not been won and is full
  #false if the board is not won and the board is not full
  #false if the board is won.
  if won?(board)
    return false
  end
  if full?(board)
    return true
  else
    return false
  end
end
#----
def over?(board)
  #returns true if the board has been won,
  #is a draw,
  #or is full
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end
#----
def won?(board)
  winning_set = nil
  won = false
  counter = 0
  position = ["", "", ""]

  WIN_COMBINATIONS.each do |i|
    counter = 0
    #puts i.to_s
    #puts "------------- each do i"
    i.each do |m|
      #puts "counter = " + counter.to_s
      position[counter] = board[m]
      counter += 1
      #puts "m index = " + m.to_s
      #puts "board[m] = " + board[m]
      #puts 'position = ' + position.to_s
      #puts "------------- each do m"
    end
    #puts "if executing.."
    if (position[0] == "X" && position[1] == "X" && position[2] == "X") ||
       (position[0] == "O" && position[1] == "O" && position[2] == "O")
         won = true
    end
    #puts "if complete. won = " + won.to_s
    if won == true
      winning_set = i
      break
    end
  end

  if won == true
    puts 'winning_set = ' + winning_set.to_s
    return winning_set
  else return false
  end
end
#----
def winner(board)
  winner = won?(board)
  puts "winner = " + winner.to_s
  if winner
    return board[winner[0]]
  else
    return nil
  end
end

puts "winner returns " + winner(board).to_s



