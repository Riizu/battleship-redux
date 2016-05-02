require_relative '../lib/player'
require_relative '../lib/ai'

class GameEngine
  attr_reader :player_1, :player_2

  def initialize
    @player_1 = Player.new
    @player_2 = AI.new
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
end
