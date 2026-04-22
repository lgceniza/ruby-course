# frozen_string_literal: true

require_relative 'model/board'
require_relative 'model/game'

def main
  board = Board.new
  game = Game.new(board)

  board.display
  until game.won?
    game.move_stage

    if game.won?
      game.declare_winner
    elsif game.stalemate?
      puts 'Stalemate!'
      break
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
