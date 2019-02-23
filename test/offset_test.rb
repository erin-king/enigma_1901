require 'date'
require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new(112982)

    assert_instance_of Offset, offset
  end

  def test_it_has_a_date_when_provided
    offset = Offset.new(112982)
    assert_equal 112982, offset.date
  end


end
