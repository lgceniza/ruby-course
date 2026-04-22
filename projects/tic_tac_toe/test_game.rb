# frozen_string_literal: true

require_relative 'main'

RSpec.describe 'Tic Tac Toe' do
  describe 'Main Loop' do
    xit 'displays board once before loop' do
    end
  end

  describe 'Game' do
    xit 'initializes properly' do
      board = 'test-board'
      game = Game.new(board)

      expect(game.board).to eq('test-board')
      expect(game.player1).to eq('X')
      expect(game.player2).to eq('O')
      expect(game.current_player).to eq('X')
      expect(game.won).to eq(false)
    end

    xit 'returns win condition from the board' do
      # mock board.check_for_win
    end

    xit 'returns cached win condition' do
      # set won to true and board.check_for_win to false
    end

    xit 'returns stalemate condition' do
      # pass through state of board.full
    end

    xit 'declares winner and win condition' do
      # correctly sets won to true and prints an output
    end

    xit 'switches to the next player from current player' do
    end

    xit 'moves stage by getting player move and displays the board' do
      # prints correct current_player
      # switches player and displays board if move was successful
    end

    xit 'gets player move' do
      # spy on board.add_piece to check arguments
    end
  end

  describe 'Board' do
    xit 'initializes properly' do
      # check variables
    end

    xit 'displays board with proper format' do
    end

    xit 'adds player piece in a correct position' do
      # parse_position returns legit coordinates, should return true
    end

    xit 'refuses to add player piece to an occupied cell' do
      # parse_position returns legit coordinates, print board is occupied, should return false
    end

    xit 'refuses to add player piece to invalid cell' do
      # parse_position returns nil
      # print invalid position, should return false
    end

    xit 'returns winner for row win condition' do
    end

    xit 'returns winner for col win condition' do
    end

    xit 'returns winner for diagonal win condition' do
    end

    xit 'returns false/no winner if no win condition found' do
    end

    xit 'correctly checks if the board is full' do
    end

    xit 'checks if three same symbols in a row is present' do
    end

    xit 'parses row and column for legit position cell' do
    end

    xit 'returns nil for invalid position cell' do
      # empty string
      # letters only
      # numbers only
      # negative number
      # valid letter, invalid number
      # invalid letter, valid number
      # invalid letter, invalid number
    end
  end
end
