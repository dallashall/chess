require "byebug"
module Slideable

  STRAIGHT = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }

  DIAGS = {
    upleft: [-1, -1],
    upright: [-1, 1],
    downright: [1, 1],
    downleft: [1, -1]
  }

  def horizontal
    # byebug
    potentials = []
    STRAIGHT.each do |k,v|
      potentials += grow_position(v)
    end
    potentials
  end

  def diagonal
    potentials = []
    DIAGS.each do |k,v|
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
    end
    potentials
  end


end
