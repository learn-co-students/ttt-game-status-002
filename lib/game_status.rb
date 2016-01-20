# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
 if board == [" "," "," "," "," "," "," "," "," "]
   return false
 else
  WIN_COMBINATIONS.detect { |winners|
    (board[winners[0]] == "X" && board[winners[1]] == "X" && board[winners[2]] == "X") ||
    (board[winners[0]] == "O" && board[winners[1]] == "O" && board[winners[2]] == "O") }
 end
end

#def won?(board)
#  WIN_COMBINATIONS.detect do |combo|
#    board[combo[0]] == board[combo[1]] &&
#    board[combo[1]] == board[combo[2]] &&
#    position_taken?(board, combo[0])
#  end
#end

def full?(board)
  board.all? { |location| location != " "}
  #any? true if block return false / false if block return true
  #all? true if block has no spaces return true / false if block has spaces return false -> session
  #Draw: return true if no spaces
  #In Session: return false if spaces
end

def draw?(board)
  board.all? { |location| location !=" " && !won?(board)}
  #Won: return false if no spaces and true for won?(board)
  #Draw:  return true if no spaces and false for won?(board)
  #In session: return false if spaces
end

def over?(board)
  full?(board)
  #return true if no spaces
end

def winner(board)
    if winning_combo = won?(board)
        board[winning_combo.first]
    end
end

  #  if !won?(board)
#  else
#    WIN_COMBINATIONS.each do |winners|
#      if (board[winners[0]] == "X" && board[winners[1]] == "X" && board[winners[2]] == "X")
#        return board[winners[0]]
#      elsif (board[winners[0]] == "O" && board[winners[1]] == "O" && board[winners[2]] == "O")
#        return board[winners[0]]
#      end
#    end
#  end
#end

#  X | X | X  return [0,1,2]
# -----------
#  O |   | O
# -----------
#    |   |
#
#  0 | 1 | 2
# -----------
#  3 | 4 | 5
# -----------
#  6 | 7 | 8

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
#WIN_COMBINATIONS = [
#[0,1,2], #top row
#[3,4,5], #middle row
#[6,7,8], #bottom row
#[0,3,6], #left column
#[1,4,7], #middle column
#[2,5,8], #right column
#[0,4,8], #left diagonal
#[6,4,2]] #right diagonal

#board = ["X","X","X","O","O"," "," "," "," "]
#winner(board)