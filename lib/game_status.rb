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
  [6,4,2]
]

def positions_taken?(board, *positions)
  positions.all? do |position|
    position_taken?(board, position)
  end
end

def same_chars?(board, p1, p2, p3)
  board[p1] == board[p2] && board[p1] == board[p3]
end

def won?(board)
  WIN_COMBINATIONS.find do |c|
    c1, c2, c3 = c[0], c[1], c[2]
    positions_taken?(board, c1, c2, c3) && same_chars?(board, c1, c2, c3)
  end
end

def full?(board)
  positions_taken?(board, 0, 1, 2, 3, 4, 5, 6, 7, 8)
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if winning_combination = won?(board)
    board[winning_combination.first]
  end
end
