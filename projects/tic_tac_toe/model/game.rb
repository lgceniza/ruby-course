# frozen_string_literal: true

# Object for the game
class Game
  attr_reader :has_winner
  attr_accessor :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2

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

  def move
    print "Player #{current_player.piece}'s turn to move! Enter board cell: "
    return unless current_player.move(@board)

    switch_player
    @board.display
  end
end
