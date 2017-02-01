require_relative "piece"
require_relative "checker"
class King < Piece
  include Steppable
  include Checker

  def symbol
    @player == @board.player_one ? " ♔ " : " ♚ "
  end

  def potential_moves
    moves(KING_MOVES)
  end


end
