require_relative "piece"
class Rook < Piece
  include Slideable

  def symbol
    @player == @board.player_one ? " ♖ " : " ♜ "
  end

  def type
    horizontal
  end
end
