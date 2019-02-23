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

  def test_it_can_decrypt_message
    skip
    assert_equal "abc abc ", @decrypt.decrypt_message("dqakdqak")
  end

  def test_it_can_decrypt_message_returning_non_alphabet_characters_as_is
    skip
    assert_equal "abc abc !", @decrypt.decrypt_message("dqakdqak!")
  end

  def test_it_can_find_a_letters_index
    assert_equal 2, @decrypt.find_letter_index("c")
  end

  def test_it_can_apply_shift_to_letter
    assert_equal "c", @decrypt.apply_shift_to_letter(3, "f")
  end

end
