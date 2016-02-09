# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8], [0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]
    array_1 = [board[win_index1], board[win_index2], board[win_index3]]
    if array_1 == ["X","X","X"]
      return combo # return the win_combination indexes that won.
    elsif array_1 == ["O","O","O"]
      return combo
    end
  end
  return false
end
def full?(board)
  !(board.any? {|position| position == " " })
end
def draw?(board)
  if (won?(board) == true)
    return false
  elsif ((won?(board) == false) && (full?(board) == false))
    return false
  elsif ((won?(board) == false) && (full?(board) == true))
    return true
  end
end
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end
def winner(board)
  if won?(board)
  character = won?(board)[0]
  board[character]
  end
end
    