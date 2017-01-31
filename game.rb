require_relative 'human_player'
require_relative 'board'

class Game
  def initialize(player_one, player_two)
    @board = Board.new(player_one, player_two)
    @current_player = @board.player_one
  end

  def play
    until @board.won?
      @current_player.play_turn
      swap_turn
    end
  end

  private

  def swap_turn
    @current_player = @current_player == @board.player_one ? @board.player_two : @board.player_one
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new("Dallas", "Ryley")
  game.play
end
