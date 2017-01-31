require_relative "steppable"
class Knight < Piece

  include Steppable

  def symbol
    @player == @board.player_one ? " ♘ " : " ♞ "
  end

  def type
    moves(KNIGHT_MOVES)
  end
end
