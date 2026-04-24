# frozen_string_literal: true

require 'rspec/mocks'
require_relative '../model/board'

RSpec.describe 'Board' do
  board = nil

  before(:each) do
    board = Board.new
  end

  it 'initializes properly' do
    board = Board.new
    expect(board.board).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    expect(board.winner).to eq(nil)
  end

  it 'displays board with proper format' do
    expected = <<~OUTPUT
        | 1 | 2 | 3 |
      A |   |   |   |
      B |   |   |   |
      C |   |   |   |

    OUTPUT

    expect { board.display }.to output(expected).to_stdout

    board.add_piece('b2', 'X')
    expected = <<~OUTPUT
        | 1 | 2 | 3 |
      A |   |   |   |
      B |   | X |   |
      C |   |   |   |

    OUTPUT

    expect { board.display }.to output(expected).to_stdout
  end

  it 'adds player piece in a correct position' do
    expect(board.add_piece('A1', 'X')).to be true
    expect(board.board[0][0]).to eq('X')
  end

  it 'refuses to add player piece to an occupied cell' do
    board.add_piece('A1', 'X')
    expect(board.add_piece('A1', 'O')).to be nil
    expect { board.add_piece('A1', 'O') }.to output("You cannot move into an occupied cell!\n").to_stdout
  end

  it 'refuses to add player piece to invalid cell' do
    expect(board.add_piece('invalid', 'X')).to be nil
    expect { board.add_piece('invalid', 'X') }.to output("Invalid position!\n").to_stdout
  end

  it 'returns winner for row win condition' do
    board.instance_variable_set(:@board, [%w[X X X], [nil, nil, nil], [nil, nil, nil]])
    expect(board.check_for_win).to be true
    expect(board.winner).to eq('X')
  end

  it 'returns winner for col win condition' do
    board.instance_variable_set(:@board, [[nil, 'X', nil], [nil, 'X', nil], [nil, 'X', nil]])
    expect(board.check_for_win).to be true
    expect(board.winner).to eq('X')
  end

  it 'returns winner for diagonal win condition' do
    board.instance_variable_set(:@board, [['X', nil, nil], [nil, 'X', nil], [nil, nil, 'X']])
    expect(board.check_for_win).to be true
    expect(board.winner).to eq('X')
  end

  it 'returns false/no winner if no win condition found' do
    board.instance_variable_set(:@board, [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    expect(board.check_for_win).to be false
    expect(board.winner).to eq(nil)
  end

  it 'correctly checks if the board is full' do
    expect(board.full?).to be false

    board.instance_variable_set(:@board, [%w[X X O], [nil, 'O', 'X'], %w[X O X]])
    expect(board.full?).to be false

    board.instance_variable_set(:@board, [%w[X X O], %w[O O X], %w[X O X]])
    expect(board.full?).to be true
  end

  it 'checks if three same symbols in a row is present' do
    expect(board.send(:three_in_a_row, %w[X X X])).to be true
    expect(board.send(:three_in_a_row, %w[O O O])).to be true
    expect(board.send(:three_in_a_row, %w[X O X])).to be false
    expect(board.send(:three_in_a_row, [nil, nil, nil])).to be false
  end

  it 'parses row and column for legit position cell' do
    expect(board.send(:parse_position, 'A1')).to eq([0, 0])
    expect(board.send(:parse_position, 'A2')).to eq([0, 1])
    expect(board.send(:parse_position, 'B2')).to eq([1, 1])
    expect(board.send(:parse_position, 'C3')).to eq([2, 2])
  end

  pos_inputs = ['', 'A', 'AA', '1', '11', '-1', 'A6', 'D1', 'D67']
  pos_inputs.each do |pos|
    it "returns nil for invalid position cell #{pos}" do
      expect(board.send(:parse_position, pos)).to eq(nil)
    end
  end
end
