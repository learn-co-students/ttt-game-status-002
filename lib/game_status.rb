def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

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
    WIN_COMBINATIONS.any? do |arr|
      win_index_1 = arr[0]
      win_index_2 = arr[1]
      win_index_3 = arr[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
         return arr
      else
        false
      end
    end
end

def full?(board)
  board.all? { |position| position == "X" || position == "O" } ? true : false
end

def draw?(board)
  if !(won?(board)) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  (won?(board) || draw?(board) || full?(board)) ? true : false
end

def winner(board)
  if !won?(board)
    nil
  elsif won?(board)
    win = won?(board)
    char = board[win[0]]
    if char == "X"
      "X"
    elsif char == "O"
      "O"
    end
  end
end
