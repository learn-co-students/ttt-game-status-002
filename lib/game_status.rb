# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0] #[0, 3, 6, 0, 1, 2, 0, 3]
    win_index_2 = win_combination[1] #[1, 4, 7, 3, 4, 5, 4, 4]
    win_index_3 = win_combination[2] #[2, 5, 8, 6, 7, 8, 8, 6]

    # board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
    # board = [" ", " ", " ", "X", "X", "X", " ", " ", " "]
    # board = ["O", " ", " ", "O", " ", " ", "O", " ", " "]

    position_1 = board[win_index_1] #board[0, 3, 6, 0, 1, 2, 0, 3]
    position_2 = board[win_index_2] #board[1, 4, 7, 3, 4, 5, 4, 4]
    position_3 = board[win_index_3] #board[2, 5, 8, 6, 7, 8, 8, 6]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

#def won?(board)
#  winning_board = board.each_index.select {|index| board[index] == "X" || board[index] == "O"}
#  if WIN_COMBINATIONS.include?(winning_board)
#    return winning_board
#  end
#end

def full?(board)
  if board.count{|i| i == ("X") || i ==("O")} == 9
    return true
  else
    return false
  end
end

#def full?(board)
#  if board.include?(" " || nil)
#    return false
#  else
#    return true
#  end
#end

#def full?(board)
#  turn_count = 0
#    board.each do |i|
#      if i == "X" || i == "O"
#        turn_count += 1
#      end
#    end
#  if turn_count < 9
#    return false
#  else
#    return true
#  end
#end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board) || won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end


