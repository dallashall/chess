require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor

  def initialize(Board.new)

    @board = board
    @cursor = Cursor.new([0,0], board, self)
  end

  def move(new_pos)

  end

  def render
    @board.each do |row|
      p row
    end
  end
end
