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

  def test_it_can_display_the_start_of_game_message
    result = capture_io {@io_handler.display_start_game_message}
    assert result
  end

  def test_it_can_sanitize_an_input_into_array_indices
    result_1 = @io_handler.sanitize_input_into_array_indices(["A1"])
    result_2 = @io_handler.sanitize_input_into_array_indices(["B3"])
    result_3 = @io_handler.sanitize_input_into_array_indices(["A1", "B1"])

    assert_equal [[0,0]], result_1
    assert_equal [[1,2]], result_2
    assert_equal [[0,0],[1,0]], result_3
  end
end
