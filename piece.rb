require_relative "slideable"

class Piece
  attr_reader :board, :player
  attr_accessor :position

  def initialize(position, board, player)
    @position = position
    @board = board
    @player = player
  end

  def valid_moves
    type
  end



end
