# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ 
  [0,1,2], [3,4,5], [6,7,8],
  [0,4,8], [2,4,6], [0,3,6],
  [1,4,7], [2,5,8]
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
  if board.all? { |el| el.match(/[XO]/) }
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) && won?(board) == false
    return true
  end
  false
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end