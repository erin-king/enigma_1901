require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("01234")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_a_key
    assert_equal "01234", @key.key
  end

  def test_it_generates_random_key_if_not_provided
    key = Key.new(nil)
    refute nil, key.key
    assert_equal 5, key.generate_key(nil).length
  end

  def test_it_can_generate_keys_a_through_d
    assert_equal 01, @key.key_a
    assert_equal 12, @key.key_b
    assert_equal 23, @key.key_c
    assert_equal 34, @key.key_d
  end

end
