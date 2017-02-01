require_relative "piece"
class Queen < Piece
  include Slideable

  def symbol
    @player == @board.player_one ? " ♕ " : " ♛ "
  end

  def potential_moves
    moves(STRAIGHT) + moves(DIAGS)
  end
end
