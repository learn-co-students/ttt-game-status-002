require 'pry'

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #top left to bottom right
  [2,4,6]  #top right to bottom left
]

def won?(board)
  array = false

  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && 
       board[combo[1]] == "X" && 
       board[combo[2]] == "X" || 
       board[combo[0]] == "O" && 
       board[combo[1]] == "O" && 
       board[combo[2]] == "O"
      array = [combo[0],combo[1],combo[2]]
    end
  end

  return array
end

def full?(board)
  board.each do |token|
    if token == " "
      return false
    end
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  boardwon = won?(board)
  if boardwon == false
    return nil
  else 
    board[boardwon[0]]
  end
end
