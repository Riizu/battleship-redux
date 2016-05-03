require_relative 'ship'
require_relative 'board'

class Player
  attr_reader :opponent, :num_shots, :ships, :ship_board, :guess_board, :ge

  def initialize(game_engine)
    @ge = game_engine
    @opponent = nil
    @num_shots = 0
    @ship_board = Board.new
    @guess_board = Board.new
    @ships = {}
  end

  def set_opponent(player)
    @opponent = player
  end

  def generate_ships(num_ships)
    num_ships.times do |i|
      size = num_ships+i
      register_ship(size, get_ship_positions(size))
      place_ship(ships[size])
    end
  end

  def get_ship_positions(size)
    positions = []
    while !ship_board.valid_positions?(positions) || \
          positions.length != size

      positions = ge.get_ship_positions(size)
    end
    positions
  end

  def register_ship(size, positions)
    ship_data = {size: size, positions: positions}
    ships[size] = Ship.new(ship_data)
  end

  def place_ship(ship)
    ship.size.times { |i| ship_board.set_position(ship.positions[i], "S") }
  end

  def take_turn
    shot_position = @ge.get_shot_position
    result = fire_shot(shot_position)
    formatted_result = "It's a #{result}!"
    @ge.display_message(formatted_result)
    @ge.update_opponent(self, shot_position, result.to_s[0].capitalize)
    update_self(shot_position, result.to_s[0].capitalize)
  end

  def update_self(position, result)
    guess_board.set_position(position, result)
  end

  def fire_shot(position)
    @num_shots += 1
    return :hit if @opponent.ship_board.get_position(position) == "S"
    :miss
  end
end
