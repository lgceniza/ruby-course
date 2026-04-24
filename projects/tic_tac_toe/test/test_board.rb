# frozen_string_literal: true

require_relative 'mock'
require_relative '../model/board'

RSpec.describe 'Board' do
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
