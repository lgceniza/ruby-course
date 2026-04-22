# frozen_string_literal: true

# Holds information about a player
class Player
  attr_reader :piece

  def initialize(piece)
    @piece = piece
  end

  def move(board)
    position = gets
    board.add_piece(position, piece)
  end
end
