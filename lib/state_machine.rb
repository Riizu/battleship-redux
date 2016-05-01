class StateMachine
  attr_reader :current_state

  def initialize
    @current_state = :start_state
    @valid_states = [:start_state, :instructions_state,
                     :game_state, :quit_state]
  end

  def set_state(state)
    if valid_state?(state)
      @current_state = state
    else
      raise ArgumentError, "Attempted to set invalid state!"
    end
  end

  def valid_state?(state)
    @valid_states.include?(state)
  end
end
