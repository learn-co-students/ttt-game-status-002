require 'pry'
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Left Column
  [1,4,7], #Middle Column
  [2,5,8], #Right Column
  [0,4,8], #Diagonal from top right
  [2,4,6] #Diagonal from top left
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |win_comb|
    if (win_comb.any? {|pos| position_taken?(board,pos)}) && (board[win_comb[0]] == board[win_comb[1]] && board[win_comb[0]] == board[win_comb[2]])
      win_comb
    end
  end
end

def full?(board)
  board.none? do |pos|
    pos == " "
  end
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

