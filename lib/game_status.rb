# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" ||position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

   WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8],
   [0, 4, 8],
   [2, 4, 6],
   ]


  def full?(board)
  count =0
  board.each do |i|
    if i == "X" || i == "O"
      count += 1
    end
  end
  if count <9
    return false
  else
    return true
  end
end




def draw?(board)
   if won?(board) == true && full?(board) == true
      return false
      # won game
   elsif full?(board) == true && won?(board) == false
      return true
      # draw game

   elsif full?(board) == false && won?(board) == false
      return false
      # in progress game
   else return false

   end
end

def over?(board)
   if won?(board) == false && draw?(board) == false
      return false
   elsif draw?(board) == true
      return true
   else return true
   end
end

def winner(board)
  if won?(board) != false
    x =  won?(board)[0]
    return board[x]
  else
    return nil
  end
end



