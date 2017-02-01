module Slideable

  STRAIGHT = [
    [0, -1],
    [0, 1],
    [-1, 0],
    [1, 0]
  ]

  DIAGS = [
    [-1, -1],
    [-1, 1],
    [1, 1],
    [1, -1]
  ]

  def moves(potential_moves)
    potentials = []
    potential_moves.each do |v|
      potentials += grow_position(v)
    end
    potentials
  end

  def grow_position(diff)
    potentials = []
    new_pos = @position
    while true
      new_pos = [new_pos[0] + diff[0], new_pos[1] + diff[1]]
      break unless @board.valid_pos(new_pos, @player)
      potentials << new_pos
      break if @board[new_pos].player != nil && @board[new_pos].player != @player
    end
    potentials
  end
end
