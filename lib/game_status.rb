# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # diag top left to bottom right
  [2,4,6]] # diag top right to bottom left

  # define your #won? method
  def won?(board)
    WIN_COMBINATIONS.detect do |wc|
      board[wc[0]] == board[wc[1]] && board[wc[1]] == board [wc[2]] && position_taken?(board, wc[0])
    end  
  end

# define your #full? method
def full?(board)
  board.all? do |location| 
    location == "X" || location == "O"
  end
end

# define your #draw? method
def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

# define #over? method
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# define #winner method
def winner(board)
  if winning_token = won?(board)
    board[winning_token[0]]
  end
end