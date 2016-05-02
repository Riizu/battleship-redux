class Ship
  attr_reader :size, :positions

  def initialize(ship_data)
    @size = ship_data[:size]
    @positions = ship_data[:positions]
    @alive = true
  end

  def alive?
    return true if positions.length > 0
    false
  end

  def take_damage(damaged_position)
    positions.delete_if {|position| damaged_position == position}
  end
end
