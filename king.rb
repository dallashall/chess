require_relative "piece"
class King < Piece
  include Steppable

  def symbol
    @player == @board.player_one ? " ♔ " : " ♚ "
  end

  def type
    moves(KING_MOVES)
  end
end
