require_relative 'test_helper'
require_relative '../lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
    assert @board
  end

  def test_it_has_a_size
    assert @board.size
  end

  def test_it_has_a_default_size_of_4
    assert_equal 4, @board.size
  end

  def test_it_has_a_grid_of_positions
    assert @board.grid
    assert_kind_of Array, @board.grid
  end

  def test_it_can_generate_a_square_grid
    @board.generate_grid(4)

    assert_equal [["~","~","~","~"],
                  ["~","~","~","~"],
                  ["~","~","~","~"],
                  ["~","~","~","~"]],
                  @board.grid
  end

  def test_it_can_set_an_invalid_position
    result = @board.set_position([4,4], "s")

    assert_equal nil, result
  end

  def test_it_can_get_a_position
    result = @board.get_position([0,0])

    assert_equal "~", result
  end

  def test_it_can_getting_an_invalid_position
    result = @board.get_position([4,4])

    assert_equal nil, result
  end

  def test_it_can_find_an_existing_value
    assert @board.find("~")
  end

  def test_it_cant_find_a_non_existant_value
    refute @board.find("y")
  end

  def test_it_can_find_a_ship
    @board.set_position([0,0], Ship.new({size: 2, positions: [[0,0],[0,1]]}))

    assert @board.find(Ship)
  end

  def test_it_can_get_a_position_that_has_a_value_other_than_default
    @board.set_position([0,0], "s")
    result = @board.get_position([0,0])

    assert_equal "s", result
  end

  def test_it_can_check_if_a_given_position_is_not_occupied
    refute @board.occupied?([0,0])
  end

  def test_it_can_check_if_a_given_position_is_occupied
    @board.set_position([0,0], "s")

    assert @board.occupied?([0,0])
  end

  def test_it_can_check_if_a_position_is_out_of_bounds
    result_1 = @board.out_of_bounds?([0,-1])
    result_2 = @board.out_of_bounds?([0,4])
    result_3 = @board.out_of_bounds?([-1,0])
    result_4 = @board.out_of_bounds?([4,0])

    assert result_1
    assert result_2
    assert result_3
    assert result_4
  end

  def test_it_can_check_if_a_position_is_in_bounds
    result = @board.out_of_bounds?([0,0])

    refute result
  end

  def test_it_can_check_if_a_position_is_adjacent_to_another
    result_1 = @board.adjacent?([1,1],[1,2])
    result_2 = @board.adjacent?([1,1],[2,1])
    result_3 = @board.adjacent?([1,1],[0,1])
    result_4 = @board.adjacent?([1,1],[1,0])

    assert result_1
    assert result_2
    assert result_3
    assert result_4
  end

  def test_it_can_check_if_a_position_is_not_adjacent_to_another
    result = @board.adjacent?([0,0],[0,2])

    refute result
  end

  def test_it_can_check_if_a_series_of_two_positions_are_valid
    result = @board.valid_positions?([[0,0],[0,1]])

    assert result
  end

  def test_it_can_check_if_a_series_of_two_or_more_positions_are_valid
    result = @board.valid_positions?([[0,0],[0,1],[0,2]])

    assert result
  end

  def test_it_can_invalidate_a_series_of_positions_if_one_is_occupied
    @board.set_position([0,0], "s")
    result = @board.valid_positions?([[0,0],[0,1],[0,2]])

    refute result
  end

  def test_it_can_invalidate_a_series_of_positions_that_are_not_adjacent
    result_1 = @board.valid_positions?([[0,0],[0,2],[0,3]])
    result_2 = @board.valid_positions?([[0,0],[0,1],[0,3]])

    refute result_1
    refute result_2
  end

end
