# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],[3, 4, 5],[6, 7, 8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])    
  end
end


def full?(board)
  board.none?{|i| i ==" "} || false
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if winner = won?(board)
    board[winner[0]]
  end
end
