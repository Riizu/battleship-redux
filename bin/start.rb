require_relative '../lib/state_machine'
require_relative '../lib/io_handler'

sm = StateMachine.new
io = IOHandler.new

while sm.current_state != :quit_state
  io.display_welcome_message
  prompt = io.prompt[0].capitalize

  case prompt
  when "P"
    sm.set_state(:game_state)
  when "I"
    sm.set_state(:instructions_state)
  when "Q"
    sm.set_state(:quit_state)
  end
end
