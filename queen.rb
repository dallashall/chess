require_relative "piece"
class Queen < Piece
  include Slideable

  def symbol
    @player == @board.player_one ? " ♕ " : " ♛ "
  end

  def type
    moves(STRAIGHT) + moves(DIAGS)
  end
end
