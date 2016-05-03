require_relative 'test_helper'
require_relative '../lib/game_engine'
require_relative '../lib/io_handler'

class GameEngineTest < Minitest::Test
  def setup
    @io = IOHandler.new
    @ge = GameEngine.new(@io)
  end

  def test_it_exists
    assert @ge
  end

  def test_it_has_a_player_one
    assert @ge.player_1
  end

  def test_it_has_a_player_two
    assert @ge.player_2
  end

  def test_its_player_one_is_a_player_by_default
    assert_kind_of Player, @ge.player_1
  end

  def test_its_player_two_is_an_AI_by_default
    assert_kind_of AI, @ge.player_2
  end
end
