class AI < Player
  def initialize(game_engine)
    super(game_engine)
    @previous_shot_positions = []
  end

  def get_ship_positions(size)
    positions = size.times.collect {|i| [rand(size),rand(size)]}
    return positions if ship_board.valid_positions?(positions)
    get_ship_positions(size)
  end

  def get_shot_position
    result = 2.times.collect {|i| rand(4)}
    if @previous_shot_positions.include?(result)
      get_shot_position
    else
      @previous_shot_positions << result
      result
    end
  end
end
