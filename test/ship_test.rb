require_relative 'test_helper'
require_relative '../lib/ship'

class ShipTest < Minitest::Test
  def setup
    @ship = Ship.new({size: 2, positions: [[0,0],[0,1]]})
  end

  def test_it_exists
    assert @ship
  end

  def test_it_has_a_size
    assert @ship.size
  end

  def test_its_size_is_initialized
    assert_equal 2, @ship.size
  end

  def test_it_has_positions
    assert_equal [[0,0],[0,1]], @ship.positions
  end

  def test_it_knows_if_its_alive
    assert @ship.alive?
  end

  def test_it_can_take_damage
    @ship.take_damage([0,0])

    assert_equal 1, @ship.positions.length
  end

  def test_it_doesnt_take_damage_if_the_position_doesnt_exist
    @ship.take_damage([0,2])

    assert_equal 2, @ship.positions.length
  end
end
