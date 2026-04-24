# frozen_string_literal: true

require 'rspec/mocks'
require_relative '../model/game'

RSpec.describe 'Game' do
  it 'initializes properly' do
    board = 'test-board'
    game = Game.new(board)

    expect(game.instance_variable_get(:@board)).to eq('test-board')
    expect(game.instance_variable_get(:@player1)).to eq('X')
    expect(game.instance_variable_get(:@player2)).to eq('O')
    expect(game.instance_variable_get(:@current_player)).to eq('X')
    expect(game.instance_variable_get(:@won)).to eq(false)
  end

  it 'returns win condition from the board' do
    board = double('board', check_for_win: true)
    game = Game.new(board)

    expect(game).to be_won
  end

  it 'returns cached win condition' do
    board = double('board', check_for_win: false)
    game = Game.new(board)

    # Manually set the won variable to true
    game.instance_variable_set(:@won, true)

    expect(game).to be_won
  end

  stalemate_condition = [true, false]
  stalemate_condition.each do |condition|
    it 'returns stalemate condition' do
      board = double('board', full?: condition)
      game = Game.new(board)

      expect(game.stalemate?).to eq(condition)
    end
  end

  it 'gives the winner message' do
    board = double('board', winner: 'X')
    game = Game.new(board)

    expect(game.winner_message).to eq('Player X has won!')
  end

  it 'switches to the next player from current player' do
    game = Game.new('test-board')
    expect(game.current_player).to eq('X')

    game.switch_player
    expect(game.current_player).to eq('O')

    game.switch_player
    expect(game.current_player).to eq('X')
  end

  it 'moves stage by getting player valid move and displays the board' do
    # prints correct current_player
    # switches player and displays board if move was successful
    board = double('board', display: nil)
    game = Game.new(board)
    allow(game).to receive(:move).and_return(true)

    expect { game.move_stage }.to output("Player X's turn to move! Enter board cell: ").to_stdout
    expect(game.current_player).to eq('O')
    expect(board).to have_received(:display)
  end

  it 'does not switch player or display board if move was unsuccessful' do
    board = double('board', display: nil)
    game = Game.new(board)
    allow(game).to receive(:move).and_return(false)

    expect { game.move_stage }.to output("Player X's turn to move! Enter board cell: ").to_stdout
    expect(game.current_player).to eq('X')
    expect(board).not_to have_received(:display)
  end

  it 'gets player move' do
    board = double('board', add_piece: nil)
    game = Game.new(board)
    input = double('input', gets: 'A1')

    game.move('X', input: input)

    expect(board).to have_received(:add_piece).with('A1', 'X')
  end
end
