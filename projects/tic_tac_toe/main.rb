# frozen_string_literal: true

require_relative 'model/board'
require_relative 'model/game'

# Game runner
class TicTacToe
  def initialize(game, board)
    @game = game
    @board = board
  end

  def play
    @board.display
    until @game.won?
      @game.move_stage

      if @game.won?
        puts @game.winner_message
      elsif @game.stalemate?
        puts 'Stalemate!'
        break
      end
    end
  end
end

def main
  board = Board.new
  game = Game.new(board)

  TicTacToe.new(game, board).play
end

main if __FILE__ == $PROGRAM_NAME
