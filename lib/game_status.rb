# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?( board )
  WIN_COMBINATIONS.each do |c|
    if board[ c[0] ] == board[ c[1] ] && board[ c[1] ] == board[ c[2] ] && ( board[ c[0] ] == "X" || board[ c[0] ] == "O" )
      return c
    end
  end
  false
end

def full?( board )
  !board.include?( " " )
end


def draw?( board )

  if won?( board )
    false
  else

    if full?( board )
      true
    else
      false
    end

  end
end


def over?( board )
  won?( board ) || draw?( board ) || full?( board )
end


def winner( board )
  win_positions = won?( board ) 
  if win_positions
    board[ win_positions[0] ]
  end
end