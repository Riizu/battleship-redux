require_relative 'test_helper'
require_relative '../lib/instructions_handler'

class InstructionsHandlerTest < MiniTest::Test
  include InstructionsHandler

  def test_it_can_return_the_formatted_instructions
    result = InstructionsHandler.instructions

    assert result
  end
end
