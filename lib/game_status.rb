# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = 
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.detect {|position| board[position[0]] == board[position[1]] && board[position[1]] == board[position[2]] && board[position[0]] != " "}
end

def full?(board)
  board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) 
end

def winner(board)
    board[won?(board)[0]] if won?(board)
end