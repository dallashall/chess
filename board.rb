require_relative "bishop"
require_relative "rook"
require_relative "queen"
require_relative "knight"
require_relative 'king'
require_relative 'pawn'
require_relative 'null'
require_relative 'position_exception'

class Board
  attr_reader :grid, :player_one, :player_two
  def initialize(player_one, player_two)
    @player_one = HumanPlayer.new(player_one, self)
    @player_two = HumanPlayer.new(player_two, self)
    @grid = setup_grid
  end

  def setup_grid
    @grid = Array.new(8) {Array.new(8)}
    @grid.each_index do |i|
      if i == 0 || i == 7
        setup_back_row(i)
      elsif i == 1 || i == 6
        setup_front_row(i)
      else
        setup_nil_row(i)
      end
    end
    @grid
  end

  def opposing_king_pos(player)
    @grid.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        return [i, j] if tile.class == King && tile.player != player
      end
    end
    nil
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end

  def valid_pos(pos, player)
    pos.all?{|el| (0..7).include?(el)} && self[pos].player != player
  end

  def valid_kill(pos, player)
    self[pos].player != nil
  end

  def valid_from(pos, player)
    self[pos].player == player
  end

  def valid_to(pos, player)
    self[pos].player != player
  end

  def move_piece(from, to)
    self[to] = self[from]
    self[to].position = to
    self[from] = Null.new(from, self, nil)
  end

  def won?
    self[opposing_king_pos(@player_one)].checkmated? ||
    self[opposing_king_pos(@player_two)].checkmated?
  end

  private
  def setup_front_row(i)
    @grid[i].map!.with_index do |tile, j|
      if i == 1
        Pawn.new([i, j], self, @player_one)
      else
        Pawn.new([i, j], self, @player_two)
      end
    end
  end

  BACK_ROW = {
      0 => Rook,
      1 => Knight,
      2 => Bishop,
      3 => Queen,
      4 => King,
      5 => Bishop,
      6 => Knight,
      7 => Rook
  }

  def setup_back_row(i)
    @grid[i].map!.with_index do |tile, j|
      if i == 0
        BACK_ROW[j].new([i, j], self, @player_one)
      else
        BACK_ROW[j].new([i, j], self, @player_two)
      end
    end
  end

  def setup_nil_row(i)
    @grid[i].map!.with_index do |_, j|
      Null.new([i, j], self, nil)
    end
  end
end
