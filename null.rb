require_relative 'piece'
class Null < Piece
  def symbol
    "   "
  end

  def threatens_king?
    false
  end
end
