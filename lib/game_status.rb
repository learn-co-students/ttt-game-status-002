board = ["X", "O", "X", "O", "O", "O", "O", "X", "X"]

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column   
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # left-to-right diagonal
  [2,4,6]  # right-to-left diagonal
  # ETC, an array for each win combination
]

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won? (board)
  WIN_COMBINATIONS.each do |win_combo_array|
    if win_combo_array.all?{|position| position_taken?(board, position) && board[position] == "X"}
      return win_combo_array
    elsif win_combo_array.all?{|position| position_taken?(board, position) && board[position] == "O"}
      return win_combo_array
    else false
    end
  end
  false
end

def full?(board)
  board.all?{|position| position == "X" || position == "O" }
end

def draw?(board)
  !full?(board) == false
  full?(board) && won?(board) == false
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if over?(board) && !draw?(board)
    board[won?(board)[1]]
  end
end



    

