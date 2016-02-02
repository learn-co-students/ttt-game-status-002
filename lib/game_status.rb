# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |wc|
    x_winner = wc.select{|wc| board[wc].strip == "X"}
    o_winner = wc.select{|wc| board[wc].strip == "O"}
    return x_winner if x_winner == wc 
    return o_winner if o_winner == wc
  end
  false
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
  

