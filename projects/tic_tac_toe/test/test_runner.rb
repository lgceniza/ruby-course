# frozen_string_literal: true

require 'rspec/mocks'
require_relative '../main'

RSpec.describe 'Runner' do
  board = nil
  game = nil

  before(:each) do
    board = double('board', display: nil)
    game = double('game', move_stage: nil)
  end

  it 'runs until game is won' do
    allow(game).to receive(:stalemate?).and_return(false)
    allow(game).to receive(:won?).and_return(false, false, false, true)
    expect(game).to receive(:move_stage).twice
    expect(game).to receive(:winner_message).once

    TicTacToe.new(game, board).play
  end

  it 'runs until stalemate' do
    allow(game).to receive(:won?).and_return(false)
    allow(game).to receive(:stalemate?).and_return(false, false, true)
    expect(game).to receive(:move_stage).thrice

    TicTacToe.new(game, board).play
  end
end
