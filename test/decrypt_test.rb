require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def setup
    @decrypt = Decrypt.new("01234", "112982")
  end

  def test_it_exists
    assert_instance_of Decrypt, @decrypt
  end
end
