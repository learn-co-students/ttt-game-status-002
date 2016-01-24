# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                     [0, 1, 2],
                     [3, 4, 5],
                     [6, 7, 8],
                     [0, 3, 6],
                     [1, 4, 7],
                     [2, 5, 8],
                     [0, 4, 8],
                     [2, 4, 6]
                     ]

def won?(board)
  i = 0 
  while i < WIN_COMBINATIONS.length
    if (board[WIN_COMBINATIONS[i][0]] == board[WIN_COMBINATIONS[i][1]]) && (board[WIN_COMBINATIONS[i][1]] == board[WIN_COMBINATIONS[i][2]]) && (board[WIN_COMBINATIONS[i][1]] != " ")
      return WIN_COMBINATIONS[i]
    else
      false
    end
    i += 1
  end
end

def full?(board)
    return true if !board.include? " "
    false
end

def draw?(board)
  if won?(board).is_a?(Array)
    return false
  end
  if full?(board) == true 
    return true
  end
  false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  return board[won?(board)[0]] if won?(board)
  nil
end





