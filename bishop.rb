require_relative "piece"
class Bishop < Piece
  include Slideable

  def symbol
    @player == @board.player_one ? " ♗ " : " ♝ "
  end

  def type
    diagonal
  end
end
