require_relative "test_helper"

class AITest < Minitest::Test
  def setup
    @io = IOHandler.new
    @ge = GameEngine.new(@io)
    @ai = AI.new(@ge)
  end

  def test_it_can_generate_ship_positions
    assert @ai.get_ship_positions(2)
  end

  def test_it_can_get_shot_positions
    assert @ai.get_shot_position
  end
end
