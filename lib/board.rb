board = ["X", "O", "X", " ", "X", "X", "O", "X", "O"]

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

 puts full?(board)
