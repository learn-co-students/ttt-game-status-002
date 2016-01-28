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
  [2,4,6],
  [0,4,8]
  ]

def won?(board)
  combo = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
  ]
    count = 0
  while count <=7
      win_index_1 = combo[count][0]
      win_index_2 = combo[count][1]
      win_index_3 = combo[count][2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if (((position_1 == "X") && (position_2 == "X") && (position_3 == "X") ) ||((position_1 == "O") &&
        (position_2 == "O") && (position_3 == "O")))
          return combo[count]
      elsif
        false
      end
    count += 1
  end
end

def full?(board)
  if board.all? {|piece| (piece == "X" )||(piece == "O")}
    return true
 else
    false
 end
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else false
  end
end

def over?(board)
  if (full?(board) || won?(board) || draw?(board))
    return true
  else false
  end
end

def winner(board)
  if won?(board)
       arry = won?(board)
         modarry = (board[arry[0]..arry[2]]).select {|x| x == "X"}
         modarry2 = (board[arry[0]..arry[2]]).select {|x| x == "O"}
      if modarry == ["X","X","X"]
        return "X"
      end

      if  modarry2 == ["O","O","O"]
        return "O"
      end
  else
      return nil
  end

end
