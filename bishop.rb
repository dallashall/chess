require_relative "piece"
class Bishop < Piece
  include Slideable

  def symbol
    @player == @board.player_one ? " ♗ " : " ♝ "
  end

  def potential_moves
    moves(DIAGS)
  end
end
