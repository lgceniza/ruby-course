# frozen_string_literal: true

# Object for the game
class Game
  attr_accessor :current_player

  def initialize(board)
    @board = board
    @player1 = 'X'
    @player2 = 'O'

    @current_player = @player1
    @won = false
  end

  def won?
    @won || @board.check_for_win
  end

  def stalemate?
    @board.full?
  end

  def declare_winner
    @won = true
    puts "Player #{@board.winner} has won!"
  end

  def switch_player
    self.current_player = current_player == @player1 ? @player2 : @player1
  end

  def move_stage
    print "Player #{current_player}'s turn to move! Enter board cell: "
    return unless move(current_player)

    switch_player
    @board.display
  end

  def move(piece)
    position = gets
    @board.add_piece(position, piece)
  end
end
