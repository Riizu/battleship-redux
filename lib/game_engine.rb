require_relative '../lib/player'
require_relative '../lib/ai'

class GameEngine
  attr_reader :player_1, :player_2

  def initialize(io_handler)
    @io = io_handler
    @player_1 = Player.new(self)
    @player_2 = AI.new(self)
  end

  def run
    @running = true
    setup
    loop do
      @io.display_grid(player_1.guess_board.grid)
      @io.display_grid(player_1.ship_board.grid)
      player_1.take_turn
      break if check_win(player_1)
      player_2.take_turn
      break if check_win(player_2)
    end
  end

  def setup
    player_1.set_opponent(player_2)
    player_2.set_opponent(player_1)
    player_2.generate_ships(2)
    @io.display_start_game_message
    player_1.generate_ships(2)
  end

  def check_win(player)
    return false if player.opponent.ship_board.find("S")
    @io.display_winner(player)
    true
  end

  def get_ship_positions(size)
    @io.get_ship_positions(size)
  end

  def get_shot_position
    @io.get_shot_position
  end

  def display_shot_result(player, result)
    @io.display_shot_result(player, result)
  end

  def update_opponent(player, position, value)
    update_ship_board(player.opponent, position, value)
  end

  def update_guess_board(player, position, value)
    player.guess_board.set_position(position, value)
  end

  def update_ship_board(player, position, value)
    player.ship_board.set_position(position, value)
  end
end
