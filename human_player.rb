require_relative 'cursor'
require_relative 'board'
require_relative 'display'
require 'byebug'

class HumanPlayer
  attr_reader :name
  def initialize(name, board)
    @name = name
    @board = board
    @display = Display.new(@board)
    @cursor = @display.cursor
  end

  def play_turn
    begin
    from, to = nil
    until from
      pos = get_input
      from = pos if @board.valid_from(pos, self)
      @display.render(@name)
    end

    until to
      to = @cursor.get_input
      from = pos if @board.valid_to(pos, self)
      @display.render(@name)
    end
    raise PositionException.new("not valid for current piece", to) unless @board[from].potential_moves.include?(to)
    rescue PositionException => e
      puts e.msg
      sleep(1)
      retry
    end
    @board.move_piece(from, to)
    @display.render(@name)
    # byebug
    opposing_king.check_or_checkmated
  end

  def opposing_king
    @board[@board.opposing_king_pos(self)]
  end

  def get_input
    pos = nil
    until pos
      @display.render(@name)
      pos = @cursor.get_input
    end
    pos
  end

end
