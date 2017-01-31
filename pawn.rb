require_relative 'piece'

class Pawn < Piece
  include Steppable

  def symbol
    @player == @board.player_one ? " ♙ " : " ♟ "
  end

  def type
    pawn_moves
  end
end
