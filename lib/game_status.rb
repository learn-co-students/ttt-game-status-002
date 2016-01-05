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
[2,4,6],
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]
     if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
     end
  end 
  false
end
 

def full?(board)
  count=0
  board.each do |i|
    if i == "X" or i =="O"
      count+=1
    end    
  end
  

  if count >= 9 
    return true
  else 
    return false
  end

end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  else
    return false
  end
  
end
  board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
def winner(board)
  if won?(board) != false
    x =  won?(board)[0]
    return board[x]
  else 
    return nil
  end
end


puts winner(board).inspect[1]

