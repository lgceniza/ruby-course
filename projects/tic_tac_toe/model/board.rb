# frozen_string_literal: true

# Holds information about the game board
class Board
  attr_accessor :board
  attr_reader :winner

  def initialize
    @board = Array.new(3) { Array.new(3) }
    @winner = nil
  end

  def display
    spacer = ' | '
    displayable = board.map do |row|
      row.map { |col| col.nil? ? ' ' : col }.join(spacer)
    end
    puts '  | 1 | 2 | 3 |'
    puts "A | #{displayable[0]} |"
    puts "B | #{displayable[1]} |"
    puts "C | #{displayable[2]} |\n\n"
  end

  def add_piece(position, piece)
    coords = parse_position(position)

    unless coords
      puts 'Invalid position!'
      return false
    end

    row, col = coords

    unless board[row][col].nil?
      puts 'You cannot move into an occupied cell!'
      return false
    end

    board[row][col] = piece

    true
  end

  def check_for_win
    check_rows(board)
    check_rows(board.transpose) if @winner.nil?
    check_diagonal(board) if @winner.nil?

    return true unless @winner.nil?

    false
  end

  def full?
    board.flatten.all?
  end

  private

  def three_in_a_row(row)
    row.any? && row[0] == row[1] && row[1] == row[2]
  end

  def check_rows(board_to_check)
    board_to_check.each do |row|
      if three_in_a_row(row)
        @winner = row[0]
        break
      end
    end
  end

  def check_diagonal(board_to_check)
    diagonal = board_to_check.map.with_index { |row, i| row[i] }
    anti_diagonal = board_to_check.map.with_index { |row, i| row[-i - 1] }
    if three_in_a_row(diagonal)
      @winner = diagonal[0]
    elsif three_in_a_row(anti_diagonal)
      @winner = anti_diagonal[0]
    end
  end

  def parse_position(position)
    row = position[0].upcase.ord - 'A'.ord
    col = position[1].to_i - 1

    return false if row < 0 || row > 2 || col < 0 || col > 2

    [row, col]
  end
end
