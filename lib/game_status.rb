# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
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
  WIN_COMBINATIONS.detect do |c| 
    board[c[0]] == board[c[1]] && board[c[1]] == board[c[2]] && position_taken?(board, c[0])
  end 
end 

def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end 
end 

def draw?(board)
  full?(board) && !won?(board)
end 

def over?(board)
  won?(board) || draw?(board) || full?(board)
end 

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end 
