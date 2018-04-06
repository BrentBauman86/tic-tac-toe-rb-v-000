WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board = ["X", "X", "X", "X", "O", "O", "O", "X", "O"])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(string)
    string.to_i - 1
    index = string.to_i-1
  end

def move(board, index, character = "X")
    board[index] = character
 end

 def position_taken?(board, index)
   !(board[index].nil? || board[index] == " ")
 end




 def valid_move?(board, index)
   index.between?(0,8) && !position_taken?(board, index)
 end

 def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(board, index)
     move(board, index)
     display_board(board)
   else
     turn(board)
   end
 end

 # Define your play method below
 def play(board)
   turn = 0
   until turn == 9
   turn(board)
       turn += 1
   end
 end
















def won?(board)
 WIN_COMBINATIONS.find do |win_plz|
 board[win_plz[0]] == board[win_plz[1]] && board[win_plz[0]] == board[win_plz[2]] && position_taken?(board, win_plz[1])
 end
end

def full?(board)
board.none? do |filled|
  filled == " " || filled.nil?
  end
 end

def draw?(board)
full?(board) == true && won?(board) == nil
end

def over?(board)
  full?(board) == true || won?(board) != nil
end

def winner(board)
  if won?(board) != nil
  win_time = board[won?(board)[2]]
 end
end
