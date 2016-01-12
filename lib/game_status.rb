# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

def won?(board)
  # Compare each winning combo to the board to see if someone won.
  WIN_COMBINATIONS.each do |winning_combo|
    if board[winning_combo[0]] == "X" && board[winning_combo[1]] == "X" && board[winning_combo[2]] == "X"
      return winning_combo
    elsif board[winning_combo[0]] == "O" && board[winning_combo[1]] == "O" && board[winning_combo[2]] == "O"
      return winning_combo
    end
  end
  # Well, I guess there weren't any wins if you made it out the loop.
  return false
end

def full?(board)
  #Are all the spaces full?
  filledSpace = 0
  board.each do |space|
    if space == "X" || space == "O"
      filledSpace += 1
    end
  end
  # If all 9 spaces are full, return true, otherwise false
  filledSpace == 9 ? true : false
end

def draw?(board)
  # Is the board full and not won?
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  # Is the game a draw? or won?
  draw?(board) || won?(board) ? true : false
end

def winner(board)
  if won?(board)
    playerwinning = won?(board)
    if board[playerwinning[0]] == "X"
      return "X"
    elsif board[playerwinning[0]] == "O"
      return "O"
    end
  else
    return nil
  end
end
