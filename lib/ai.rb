class AI < Player
  def generate_guess
    result = []
    result << rand(4) << rand(4)
  end

  def get_ship_positions(size)
    result = []
    while result.length != size
      position = [rand(size),rand(size)]
      if ship_board.check_left(position, size)
        result << position
      elsif ship_board.check_right(position, size)
        result << position
      elsif ship_board.check_up(position, size)
        result << position
      elsif ship_board.check_down(position, size)
        result << position
      end
    end
    result
  end

  def get_shot_position
    result = []
    result << rand(4) << rand(4)
  end
end
