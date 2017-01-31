require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def move(new_pos)

  end

  # def test
  #   while true
  #     @cursor.get_input
  #     render
  #   end
  # end

  SYMBOLS = {

  }

  def render(name)
    system("clear")
    string = ""
    @board.grid.each.with_index do |row, i|
      row.each.with_index do |tile, j|
        if @cursor.cursor_pos == [i,j]
          string += (tile.nil? ?  "   ".on_light_red : @board[[i, j]].symbol.on_light_blue)
        else
          if i.even? && j.even?
            string += (tile.nil? ?  "   ".on_light_white : @board[[i, j]].symbol.light_black.on_light_white)
          elsif i.odd? && j.odd?
            string += (tile.nil? ?  "   ".on_light_white : @board[[i, j]].symbol.light_black.on_light_white )
          else
            string += (tile.nil? ?  "   ".on_black : @board[[i, j]].symbol.light_black )
          end
        end
      end
      string += "\n"
    end
    puts string
    puts "#{name}, it's your turn!"

  end

end
