require_relative '../lib/state_machine'
require_relative '../lib/io_handler'
require_relative '../lib/instructions_handler'

include InstructionsHandler

sm = StateMachine.new
io = IOHandler.new

io.display_welcome_message

while sm.current_state != :quit_state
  prompt = io.get_repl_input

  case prompt
  when "P"
    sm.set_state(:game_state)
  when "I"
    sm.set_state(:instructions_state)
    io.display_message(InstructionsHandler.instructions)
  when "Q"
    sm.set_state(:quit_state)
  end
end
