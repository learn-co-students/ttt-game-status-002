# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # \
  [2,4,6]  # /
]

# Define #won? method that returns the winning combination of the board argument
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    # win_combo is a 3 element array of indexes that compose a win, [0,1,2]
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
      return win_combo # return the win_combo indexes that won.
    end
  end
  false
end

# Define #full? method that determines returns true for a full board
def full?(board)
  board.all? do |token|
    token == "X" ||  token == "O"
  end
end

# Define #draw? method that returns true for a full board without a winning combination
def draw?(board)
  full?(board) && !won?(board)
end

# Define #over? method that returns true if there is a winning combo, draw, or full board
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# Define #winner method that returns the token of the winning combo, "X" or "O"
def winner(board)
  win_combo = won?(board)
  if win_combo.class == Array
    return board[win_combo[0]]
  end
end