require_relative 'test_helper'
require_relative '../lib/state_machine'

class StateMachineTest < Minitest::Test
  def setup
    @sm = StateMachine.new
  end

  def test_it_exists
    assert @sm
  end

  def test_it_has_a_current_state
    assert_equal :stop_state, @sm.current_state
  end

  def test_it_can_switch_states
    @sm.set_state(:game_state)

    assert_equal :game_state, @sm.current_state
  end

  def test_it_can_determine_invalid_states
    assert_raises ArgumentError do
      @sm.set_state(:pause_state)
    end
  end
end
