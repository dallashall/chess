require_relative 'cursor'
require_relative 'board'
require_relative 'display'

class HumanPlayer

  def initialize(name, board)
    @name = name
    @board = board
    @display = Display.new(@board)
    @cursor = @display.cursor
  end

  def play_turn
    from = nil
    to = nil
    until from
      pos = nil
      until pos
        @display.render(@name)
        pos = @cursor.get_input
      end
      from = pos if @board.valid_from(pos, self)
      @display.render(@name)
    end

    until to
      to = @cursor.get_input
      from = pos if @board.valid_to(pos, self)
      @display.render(@name)
    end

    @board.move_piece(from, to)
    @display.render(@name)
  end



end
