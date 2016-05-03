require_relative '../lib/player'
require_relative '../lib/ai'

class GameEngine
  attr_reader :player_1, :player_2

  def initialize(io_handler)
    @io = io_handler
    @player_1 = Player.new(self)
    @player_2 = AI.new(self)
    @running = false
  end

  def running?
    return true if @running == true
    false
  end

  def run
    @running = true

    player_1.set_opponent(player_2)
    player_2.set_opponent(player_1)

    player_2.generate_ships(2)
    @io.display_start_game_message
    player_1.generate_ships(2)

    while running?
      @io.display_grid(player_1.guess_board.grid)
      @io.display_grid(player_1.ship_board.grid)
      player_1.take_turn
      @io.display_grid(player_1.guess_board.grid)
      @io.display_grid(player_1.ship_board.grid)
      #check win

      player_2.take_turn
      @io.display_grid(player_1.guess_board.grid)
      @io.display_grid(player_1.ship_board.grid)
      #check win
      @running = false
    end
  end

  def get_ship_positions(size)
    @io.get_ship_positions(size)
  end

  def get_shot_position
    @io.get_shot_position
  end

  def display_message(string)
    @io.display_message(string)
  end

  def update_guess_board(player, position, value)
    player.guess_board.set_position(position, value)
  end

  def update_ship_board(player, position, value)
    player.ship_board.set_position(position, value)
  end
end
