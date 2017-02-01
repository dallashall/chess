require 'byebug'

module Steppable
  KNIGHT_MOVES = [
    [2, 1],
    [-2, -1],
    [-2, 1],
    [2, -1],
    [1, 2],
    [-1, -2],
    [-1, 2],
    [1, -2]
  ]

  KING_MOVES = [
    [1,1],
    [-1,-1],
    [-1,1],
    [1,-1],
    [1,0],
    [-1,0],
    [0,1],
    [0,-1],
  ]

  PLAYER_ONE_PAWN_MOVES = [
    [1, 0],
    [1, 1],
    [1, -1]
  ]

  PLAYER_TWO_PAWN_MOVES = [
    [-1,0],
    [-1, -1],
    [-1, 1]
  ]

  def moves(potential_moves)
    potentials = []
    potential_moves.each do |arr|
      potentials += grow_position(arr)
    end
    potentials
  end

  def pawn_moves
    potentials = []
    moves = (self.player == board.player_one ? PLAYER_ONE_PAWN_MOVES : PLAYER_TWO_PAWN_MOVES)
    moves.each.with_index do |arr, idx|
      potentials += idx == 0 ?  grow_pawn_position(arr) : adjacent_kill(arr)
    end
    # byebug
    potentials
  end

  private

  def adjacent_kill(diff)
    new_pos = potential_pos(diff)
    @board.valid_pos(new_pos, @player) && @board.valid_kill(new_pos, @player) ? [new_pos] : []
  end

  def grow_pawn_position(diff)
    new_pos = potential_pos(diff)
    @board.valid_pos(new_pos, @player) && @board[new_pos].player.nil? ? [new_pos] : []
  end

  def potential_pos(diff)
    [@position[0] + diff[0], @position[1] + diff[1]]
  end

  def grow_position(diff)
    potentials = []
    new_pos = potential_pos(diff)
    potentials << new_pos if @board.valid_pos(new_pos, @player)
    potentials
  end
end
