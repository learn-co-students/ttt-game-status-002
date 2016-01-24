#require 'pry'

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

#won? method
def won?(board)
  WIN_COMBINATIONS.each do |wc|
    i1 = wc[0]
    i2 = wc[1]
    i3 = wc[2]
    p1 = board[i1]
    p2 = board[i2]
    p3 = board[i3]
    if position_taken?(board,i1) && position_taken?(board,i2) && position_taken?(board,i3)
      if p1 == p2 && p1 == p3 && p2 == p3
        return wc
      end
    end
  end
  return nil
end

#full? method
def full?(board)
  !board.any?{|i| i == " " || i == nil} && !won?(board)
end

#draw? method
def draw?(board)
  full?(board) && !won?(board)
end

#over? method
def over?(board)
  full?(board) || won?(board)
end

#winner method
def winner(board)
  ret = won?(board)
  if ret
    return board[ret[0]]
  end
end
