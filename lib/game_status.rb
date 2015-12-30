# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def full?(board)
  !board.include?(" ") #if there is an empty space, then not full
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

  # ETC, an array for each win combination
]

def won?(board)
  for win_combo in WIN_COMBINATIONS
    position1 = board[win_combo[0]]
    position2 = board[win_combo[1]]
    position3 = board[win_combo[2]]
    if position1 == position2 && position2 == position3 && position1 != " "
      return win_combo
    end
  end
  return false
end

def draw?(board)
  return !won?(board) && full?(board)
end

def over?(board)
  return won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
