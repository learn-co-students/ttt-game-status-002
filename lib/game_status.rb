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
[6, 4, 2]
]



def won?(board)
    WIN_COMBINATIONS.any? do |i|
        if board[i[0]] == "X"  && board[i[1]] == "X" && board[i[2]] == "X" || 
           board[i[0]] == "O"  && board[i[1]] == "O" && board[i[2]] == "O"
            return i 
        else 
            false
        end
    end
end


 def full?(board)
  count = 0
    board.each do |i|
      if i == "X" || i == "O"
      count += 1
      end
    end
     if count < 9
      return false
     else
     true
  end
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
  if won?(board) || draw?(board) || full?(board)
  return true
  else
    false
  end
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



