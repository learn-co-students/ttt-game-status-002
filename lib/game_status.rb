# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_array|
    board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X" or board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
  end
end

def isvalid?(index)
  index == "X" or index == "O"
end

def full?(board)
  board.all?{|index| isvalid? index}
end

def draw?(board)
  won?(board) == nil && full?(board)
end

def over?(board)
  won?(board) or full?(board) or draw?(board)
end

def winner(board)
  if won?(board) != nil
    board[won?(board)[0]]
  end
end



