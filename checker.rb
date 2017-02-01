require "byebug"
module Checker
  def in_check?
    !enemy_pieces.empty?
  end

  def check_or_checkmated
    if in_check? && checkmated?
      puts "Checkmated!"
      sleep(1)
    elsif in_check?
      puts "Check"
      sleep(1)
    end
  end

  def enemy_pieces
    enemies = []
    @board.grid.each do |row|
      enemies += row.select { |tile| tile.threatens_king? }
    end
    enemies
  end

  def ally_pieces
    allies = []
    @board.grid.each do |row|
      allies += row.select { |tile| tile.player == @player }
    end
    allies
  end

  def checkmated?
    return false if allies_can_break_check?
    true
  end

  def allies_can_break_check?
    ally_pieces.each do |ally|
      return true if can_break_check?(ally)
    end
    false
  end

  def can_break_check?(ally)
    bool = false
    previous_pos = ally.position.dup
    ally.potential_moves.each do |move|
      @board.move_piece(previous_pos, move)
      bool = true unless in_check?
      @board[previous_pos], @board[move] = @board[move], @board[previous_pos]
    end
  end
end


# bool
