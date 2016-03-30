# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6]
  ]

def positions_filled(board)
  #this method i was planning on using just by looking at the tests but then decided not to after reading the instructions
  locations = [0,1,2,3,4,5,6,7,8]
  locations.select do |location|
    position_taken?(board, location)
  end
end

def won?(board)


  if board.all?{|x| x == " "}
    return false
  end

  #originally i was planning on doing something like making a board for each combo and comparing it to board
  #well that was when i just started looking at the tests and didnt read the instructions
  status = WIN_COMBINATIONS.select do |combo|
    #this condition seems pretty janky lol
    (position_taken?(board,combo[0]) && position_taken?(board,combo[1]) && position_taken?(board,combo[2])) && (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]])
  end

  if !status.empty?
    return status[0]
  end

end

def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
  #that reurn value if true i think needs a little more explanation
  #need to know what #won? gives in winning and losing scenarios since i think that index should have the winning char
end
#board = ["O", " ", " ", "O", " ", " ", "O", " ", " "]
#puts positions_filled(board)