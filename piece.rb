require_relative "slideable"

class Piece
  attr_reader :board, :player
  attr_accessor :position

  def initialize(position, board, player)
    @position = position
    @board = board
    @player = player
  end

  def threatens_king?
    enemy_king_pos = @board.opposing_king_pos(@player)
    if potential_moves.include?(enemy_king_pos)
      true
    end
  end
end
