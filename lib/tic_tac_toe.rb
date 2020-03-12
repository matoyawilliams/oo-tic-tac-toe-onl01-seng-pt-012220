class TicTacToe
  def initialize(board = nil)
  def initialize(board= nil)
    @board = board || Array.new(9," ")
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
@@ -10,20 +10,23 @@ def display_board
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(input,character="X")
    index= input.to_i - 1
    @board[index]=character
  def input_to_index(input)
    index = input.to_i - 1
  end
  def move(input ,character="X")
    index = input_to_index(input)
    @board[index]= character
  end
  def position_taken?(index)
    if  @board[index]== "X" || @board[index]== "O"
      if  @board[index]== "X" || @board[index]== "O"
      return true
    else
      return false
    end
  end
  def valid_move?(input)
      index= input.to_i - 1
    if index >= 0 && index <= 8
    index = input_to_index(input)
    if (0..8).include?(index)
        if position_taken?(index)== false || position_taken?(index)== nil
        true
      else
@@ -34,15 +37,15 @@ def valid_move?(input)
  def turn
    puts "Please enter 1-9:"
    input= gets.chomp
      index= input.to_i - 1
    index= input_to_index(input)
    if valid_move?(input)== true
      move(index,current_player)
      move(input,current_player)
      display_board
    else
    until valid_move?(input)== true
        puts "Please enter 1-9:"
        input= gets.chomp
        index= input.to_i - 1
        index = input_to_index(input)
      end
    end
  end
@@ -80,7 +83,7 @@ def draw?
       return true
     end
   end
   def over?
    def over?
       if won? == true || full? == true
         return true
      end
@@ -95,10 +98,9 @@ def winner
       end
     end
  def play
  over = over?
    over = over?
    until  over == true
      if won? != false
         winner
      if won?!= false
       break
      end
      if draw? == true
@@ -108,12 +110,11 @@ def play
      over = over?
    end
    if won?!= false
       winner
      winner
      puts "Congratulations #{winner}!"
    end
    if draw? == true
      puts "Cats Game!"
    end
  end

end


require 'pry'
require_relative '../lib/tic_tac_toe.rb'
puts "Welcome to Tic Tac Toe!"
tic_tac_toe = TicTacToe.new
tic_tac_toe.play
game = TicTacToe.new
game.play