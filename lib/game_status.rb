# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)

  draw = board.none? do |position|
    position == " "
  end

  empty = board.all? do |position|
    position == " "
  end

  WIN_COMBINATIONS.each do |combination|
    winposition1 = board[combination[0]]
    winposition2 = board[combination[1]]
    winposition3 = board[combination[2]]

    if empty
      return false
    elsif winposition1 == "X" && winposition2 == "X" && winposition3 == "X"
      return combination
    elsif winposition1 == "O" && winposition2 == "O" && winposition3 == "O"
      return combination
    else
      false
    end
  end
  if draw
    return false
  end
end

def full?(board)
  full = board.all? do |position|
    position == "X" || position == "O"
  end

  if full
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  else
    return false
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
    return board[won?(board)[0]]
  end
end
