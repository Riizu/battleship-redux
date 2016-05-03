class Board
  attr_reader :size, :grid

  def initialize
    @size = 4
    @grid = generate_grid(@size)
  end

  def generate_grid(size)
    Array.new(size) do |x|
      Array.new(size) do |y|
        "~"
      end
    end
  end

  def set_position(position, value)
    grid[position[0]][position[1]] = value
  end

  def get_position(position)
    grid[position[0]][position[1]]
  end

  def find(value)
     grid.any? { |row| row.include? "S" }
  end

  def occupied?(position)
    return true if grid[position[0]][position[1]] != "~"
    false
  end

  def out_of_bounds?(position)
    if position[0] < 0 || position[0] >= size
      true
    elsif position[1] < 0 || position[1] >= size
      true
    else
      false
    end
  end

  def adjacent?(position_a, position_b)
    if position_a[1] == position_b[1]+1
      true
    elsif position_a[0] == position_b[0]+1
      true
    elsif position_a[0] == position_b[0]-1
      true
    elsif position_a[1] == position_b[1]-1
      true
    else
      false
    end
  end

  def valid_positions?(positions)
    positions.length.times do |i|
      return false if out_of_bounds?(positions[i])
      return false if occupied?(positions[i])
    end

    positions.length.times do |i|
      return true if positions[i+1].nil?
      return false if !adjacent?(positions[i], positions[i+1])
    end
  end
end
