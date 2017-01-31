require_relative "steppable"
class Knight < Piece

  include Steppable

  def symbol
    @player == @board.player_one ? " ♘ " : " ♞ "
  end

  def type
    knight_moves
  end
end
