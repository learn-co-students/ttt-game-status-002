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
  
#   win_index_1 = win_combination[0]
#   win_index_2 = win_combination[1]
#   win_index_3 = win_combination[2]
#   win_index_4 = win_combination[3]
#   win_index_5 = win_combination[4]
#   win_index_6 = win_combination[5]
#   win_index_7 = win_combination[6]
#   win_index_8 = win_combination[7]
#   win_index_9 = win_combination[8]


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
    i = 0
    while i < board.length
      if board[i] == " "
        return false
      else
        return true
      end
      i += 1
    end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end





