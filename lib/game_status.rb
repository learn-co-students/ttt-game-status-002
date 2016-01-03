# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
	[0,1,2],
	[3,4,5],
	[6,7,8],
	[0,3,6],
	[1,4,7],
	[2,5,8],
	[0,4,8],
	[6,4,2]
]

# Will take a board, check for winning combo. 
def won?(board)
	 WIN_COMBINATIONS.each do | winning_combo |
		a, b, c = winning_combo[0], winning_combo[1], winning_combo[2]
		if board[a] == 'X' && board[b] == 'X' && board[c] =='X'
			return winning_combo
		elsif board[a] =='O' && board[b] == 'O' && board[c] == 'O'
			return winning_combo 
		end
	end
	nil
end


def full?(board)
	!board.detect{|x| x == ' '}
end

def empty?(board)
	!board.detect{|x| x == 'X' || x == 'O'}
end

def draw?(board)
	full?(board) && !won?(board)
end

def over?(board)
	draw?(board) || !won?(board).nil?
end

def winner(board)
		win = won?(board)
		unless win.nil?
			 board[win[0]]
		end
end
