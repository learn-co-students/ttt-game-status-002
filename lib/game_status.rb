require 'pry'

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Diagonal
  [2,4,6], # Diagonal
]

def won?(board)

  WIN_COMBINATIONS.any? do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
      else
      false
    end
  
  end
end

def full?(board)
  spot = 0
  9.times do 
    if position_taken?(board, spot)
      spot += 1
    else 
      return false
    end
  end
end

def draw?(board)
  if full?(board)
    if won?(board)
      return false
    else
      return true
    end
  else
    return false
  end
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)

  if won?(board) == false
    return nil
  else
    winning_array = won?(board)
    winning_character = board[winning_array[0]]
    return winning_character
  end
end