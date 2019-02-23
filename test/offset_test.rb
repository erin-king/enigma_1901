require 'date'
require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new(112982)
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_has_a_date_when_provided
    assert_equal 112982, @offset.date
  end

  def test_it_has_todays_date_when_date_not_provided

  end


end
