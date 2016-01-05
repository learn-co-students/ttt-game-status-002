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
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    x = combination.map do |space|
      board[space]
    end

    return combination if x.count("X") == 3 || x.count("O") == 3

  end
  return false
end

def full?(board)
  if board.count("X") + board.count("O") == 9
    true
  else
    false
  end

end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board)
    true
  else
    false
  end

end

def winner(board)
  return nil unless won?(board)

  combination = won?(board)
   winning = combination.map do |space|
     board[space]
   end

  if winning.count("X") == 3
     "X"
  else winning.count("O") == 3
     "O"
  end

end







