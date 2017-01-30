require_relative "piece"
require_relative 'position_exception'


class Board
  attr_reader :grid
  def initialize
    @grid = setup_grid
    @display = Display.new(self)
  end

  def setup_grid
    grid = Array.new(8) {Array.new(8){ nil }}
    [0, 1, 6, 7].each do |idx|
      grid[idx].map! { |el| Piece.new }
    end
    grid
  end

  def [](x,y)
    @grid[y][x]
  end

  def []=(x,y, piece)
    @grid[y][x] = piece
  end

  def dup

  end

  def move_piece(from, to)
    raise PositionException.new("empty", from) if self[*from].nil?
    raise PositionException.new("filled", to) if self[*to]
    self[*to] = self[*from]
    self[*from] = nil
  end

  def checkmate?

  end

  protected
  def make_starting_grid

  end

  def find_king(color)

  end
end
