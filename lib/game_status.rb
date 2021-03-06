# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    pos1 = combo[0]
    pos2 = combo[1]
    pos3 = combo[2]
    if board[pos1] == board[pos2] && board[pos2] == board[pos3] && board[pos1] != "" && board[pos1] != " "
      return combo
    end
  end
  return false
end

def full?(board)
  board.each do |pos|
    if pos == "" || pos == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else 
    return false
  end
end

def winner(board)
  if over?(board) && won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end