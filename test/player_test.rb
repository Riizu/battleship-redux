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
    assert @player.board
    assert_kind_of Board, @player.board
  end

  def test_it_has_a_collection_of_ships
    assert @player.ships
    assert_kind_of Hash, @player.ships
  end

  def test_it_can_place_ships
    # @player.place_ships(2)
    #
    # assert_equal 2, @player.ships.length
  end

  def test_it_can_make_a_shot
    #TODO come back after you finish ship and board
  end
end
