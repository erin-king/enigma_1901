require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/offset'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @offset = Offset.new("112982")
    @key = Key.new("01234")
    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_add_key_and_offset_to_create_shifts
    assert_equal 3, @shift.shift_a
    assert_equal 15, @shift.shift_b
    assert_equal 25, @shift.shift_c
    assert_equal 38, @shift.shift_d
  end
end
