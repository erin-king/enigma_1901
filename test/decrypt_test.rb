require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryption'

class DecryptTest < Minitest::Test

  def setup
    @decrypt = Decrypt.new("01234", "112982")
  end

  def test_it_exists
    assert_instance_of Decrypt, @decrypt
  end

  def test_decrypt_returns_hash
    expected = {
          decryption: "abc abc ",
          key: "01234",
          date: "112982"
        }
      assert_equal expected, @decrypt.decrypt("dqakdqak")
  end

  def test_it_can_decrypt_cyphertext
    assert_equal "abc abc ", @decrypt.decrypt_cyphertext("dqakdqak")
  end

  def test_it_can_decrypt_cyphertext_returning_non_alphabet_characters_as_is
    assert_equal "abc abc !", @decrypt.decrypt_cyphertext("dqakdqak!")
  end

  def test_it_can_find_a_letters_index
    assert_equal 2, @decrypt.find_letter_index("c")
  end

  def test_it_can_apply_shift_to_letter
    assert_equal "c", @decrypt.apply_shift_to_letter(3, "f")
  end

end
