require 'date'
require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new("112982")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_has_a_date_when_provided
    assert_equal "112982", @offset.date
  end

  def test_it_has_todays_date_when_date_not_provided
    offset = Offset.new(nil)
    assert_equal "022319", offset.date
  end

  def test_it_can_format_date_when_given_nil
    offset = Offset.new(nil)

    assert_equal "022319", offset.format_date(nil)
  end

  def test_format_date_returns_argument_date_if_date_is_not_nil
    offset = Offset.new("112982")

    assert_equal "112982", offset.format_date("112982")
  end


end
