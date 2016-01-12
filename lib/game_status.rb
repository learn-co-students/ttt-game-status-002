# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,4,8],  # top left to bottom right win
  [2,4,6],  # top right to bottom left win
  [0,3,6],   # first col
  [1,4,7],  # second col
  [2,5,8]   # third col
]
def winner(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X"
     "X"
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
      "X"
  elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
     "X"
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
    "X"
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
    "X"
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
    "X"
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
    "X"
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
    "X"
  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
    "O"
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
    "O"
  elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
    "O"
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    "O"
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    "O"
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    "O"
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
    "O"
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
    "O"
  else
    return nil
  end
end
def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) != nil
    return true
  else
    return false
  end
end
def draw?(board)
  if full?(board) == true && won?(board) == nil
    return true
  else
    return false
  end
end
def full?(board)
  if board[0] != " " && board[1] != " " && board[2] != " " && board[3] != " " && board[4] != " " && board[5] != " " && board[6] != " " && board[7] != " " && board[8] != " "
    return true
  else
    return false
  end
end
def won?(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X"
     winX =[0,1,2]
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    winX =[3,4,5]
  elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
     winX =[6,7,8]
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
    winX = [0,3,6]
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
    winX = [1,4,7]
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
    winX = [2,5,8]
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
    winX = [0,4,8]
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
    winX = [2,4,6]
  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
    wonO =[0,1,2]
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
    winO =[3,4,5]
  elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
    winO =[6,7,8]
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    winO = [0,3,6]
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    winO = [1,4,7]
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    winO = [2,5,8]
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
    winO = [0,4,8]
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
    winO = [2,4,6]
  else
    return nil
  end
end