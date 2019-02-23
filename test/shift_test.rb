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
end
