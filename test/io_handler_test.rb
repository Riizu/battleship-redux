require_relative 'test_helper'
require_relative '../lib/io_handler'

class IOHandlerTest < Minitest::Test
  def setup
    @io_handler = IOHandler.new
  end

  def test_it_exists
    assert @io_handler
  end

  def test_it_can_display_the_welcome_message
    result = capture_io {@io_handler.display_welcome_message}
    assert result
  end

  def test_it_can_display_a_message
    result = capture_io {@io_handler.display_message("test")}
    assert result
  end
end
