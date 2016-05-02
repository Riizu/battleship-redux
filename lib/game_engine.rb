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

    #generate computer ships
    #generate player ships
    while running?
      #render the player board
      #player takes turn
      #render board
      #check win
      #AI takes turn
      #render player board
      #check win
      @running = false
    end
  end

  def get_ship_coords(size)
    @io.get_ship_coords(size)
  end
end
