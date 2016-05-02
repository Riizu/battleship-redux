require_relative 'ship'
require_relative 'board'

class Player
  attr_reader :num_shots, :ships, :board, :ge

  def initialize(game_engine)
    @ge = game_engine
    @num_shots = 0
    @board = Board.new
    @ships = {}
  end

  def place_ships(num_ships)
    num_ships.times do |i|
      position = 0
      loop do
        position = ge.get_ship_coords(num_ships+i)
        break if board.valid_coords?(position)
      end
      ships[position] = Ship.new
    end
  end
end
