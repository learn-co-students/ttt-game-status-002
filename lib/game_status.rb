# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top Row Win
  [3, 4, 5], # Mid Row Win
  [6, 7, 8], # Bottom Row Win
  [0, 3, 6], # Left Column Win
  [1, 4, 7], # Middle Column Win
  [2, 5, 8], # Right Column Win
  [0, 4, 8], # Backslash Win
  [2, 4, 6], # Frontslash Win
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||
      board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    end
  end
  false
end


def full?(board)
  return true if board.all? {|a| a.match(/[XO]/)}
  false
end

def draw?(board)
  return true if full?(board) && won?(board) == false
  false
end

def over?(board)
  return true if full?(board) || won?(board) || draw?(board)
  false
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
