# frozen_string_literal: true

require_relative 'model/board'
require_relative 'model/player'
require_relative 'model/game'

board = Board.new
player1 = Player.new('X')
player2 = Player.new('O')
game = Game.new(board, player1, player2)

board.display
until game.won?
  game.move

  if game.won?
    game.declare_winner
  elsif game.stalemate?
    puts 'Stalemate!'
    break
  end
end
