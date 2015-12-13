# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

# WIN_COMBINATIONS are in chronological order and based on index within board
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], # Horizontal
                    [0,3,6], [1,4,7], [2,5,8], # Vertical
                    [0,4,8], [2,4,6]]          # Diagonal

# Counts the number of Xs and Os on the board and send back the current turn
def full?(board)
  filled_tiles = 0
  board.each { |tile| tile == "X" || tile == "O" ? (filled_tiles += 1) : ()}
  filled_tiles == 9 ?  (return true) : (return false)
end

# Finds all the indexes of X and O, then loops through each winning combination to see if either X or O's indexes match.
# If the winning combination is found it is returned, otherwise false is returned.
def won?(board)
  # Checks all tiles in board and tracks the indexes where Xs and Os are
  x_indexes, o_indexes = [], []
  index = 0
until index == 9
board[index] == "X" ? x_indexes.push(index) : (board[index] == "O" ? (o_indexes.push(index)) : ())
index += 1
  end

# Checks each win_combination and selects the X or O indexes which match any of the win_combination indexes
# If the matches include a win_combination, that combination is returned, otherwise false is returned.
  WIN_COMBINATIONS.each { |win_combination|
  x_indexes.select {|idx| win_combination.include?(idx)} == win_combination || o_indexes.select {|idx| win_combination.include?(idx)} == win_combination ? (return win_combination) : ()
  }
return false

end

# Draw if nobody wins and the board is full
def draw?(board)
  won?(board) == false && full?(board) == true ? (return true) : (return false)
end

# Over if X or O won or they drawed
def over?(board)
  won?(board).is_a?(Array) || draw?(board) == true ? (return true) : (return false)
end

# If someone won, function searches board in first index returned from won?() function for the winner (X/O)
# Returns nil otherwise
def winner(board)
  won?(board).is_a?(Array) ? (return board[won?(board)[0]]) : (return nil)
end
