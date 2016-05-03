require_relative 'test_helper'
require_relative '../lib/player'
require_relative '../lib/game_engine'
require_relative '../lib/io_handler'

class PlayerTest < Minitest::Test
  def setup
    @io = IOHandler.new
    @ge = GameEngine.new(@io)
    @player = Player.new(@ge)
  end

  def test_it_exists
    assert @player
  end

  def test_it_has_a_number_of_shots
    assert @player.num_shots
  end

  def test_its_number_of_shots_is_zero_by_default
    assert_equal 0, @player.num_shots
  end

  def test_it_has_a_board
    assert @player.ship_board
    assert_kind_of Board, @player.ship_board
  end

  def test_it_has_a_collection_of_ships
    assert @player.ships
    assert_kind_of Hash, @player.ships
  end

  def test_it_doesnt_have_an_opponent_by_default
    refute @player.opponent
  end

  def test_it_can_set_an_opponent
    @player.set_opponent("test")

    assert @player.opponent
    assert_equal "test", @player.opponent
  end

  def test_it_can_generate_ships
    skip #skipped due to necessity to enter input
    @player.generate_ships(2)

    assert_equal 2, @player.ships.length
  end

  def test_it_can_register_a_ship
    @player.register_ship(2, [[0,0],[0,1]])

    assert_kind_of Ship, @player.ships[2]
  end

  def test_it_can_place_a_ship
    ship_data = {size: 2, positions: [[0,1],[0,2]]}
    @player.place_ship(Ship.new(ship_data))

    assert_kind_of Ship, @player.ship_board.grid[0][1]
    assert_kind_of Ship, @player.ship_board.grid[0][2]
  end

  def test_it_can_fire_a_shot
    @player.set_opponent(Player.new(@ge))

    result = @player.fire_shot([0,0])

    assert_equal 1, @player.num_shots
    assert_equal :miss, result
  end

  def test_it_can_update_itself
    @player.update_self([0,0], "H")

    assert_equal "H", @player.guess_board.grid[0][0]
  end
end
