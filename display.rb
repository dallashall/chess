require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render(name)
    system("clear")
    string = ""
    @board.grid.each.with_index do |row, i|
      row.each_index do |j|
        string += color(i, j)
      end
      string += "\n"
    end
    puts string
    puts "#{name}, it's your turn!"
  end

  def color(i, j)
    pos_symbol = @board[[i, j]].symbol
    if @cursor.cursor_pos == [i,j]
      pos_symbol.on_light_blue
    else
      if i.even? && j.even?
        pos_symbol.light_black.on_light_white
      elsif i.odd? && j.odd?
        pos_symbol.light_black.on_light_white
      else
        pos_symbol.light_black
      end
    end
  end

end
