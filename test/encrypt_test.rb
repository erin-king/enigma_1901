require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'

class EncryptTest < Minitest::Test

  def setup
    @encrypt = Encrypt.new("01234", "112982")
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_encrypt_returns_hash
    expected = {
          encryption: "dqakdqak",
          key: "01234",
          date: "112982"
        }
      assert_equal expected, @encrypt.encrypt("abc abc ")
  end

  def test_it_can_create_shifts_using_key_and_date_arguments
    assert_equal 3, @encrypt.shift.shift_a
    assert_equal 15, @encrypt.shift.shift_b
    assert_equal 25, @encrypt.shift.shift_c
    assert_equal 38, @encrypt.shift.shift_d
  end

  def test_it_can_encrypt_message
    assert_equal "dqakdqak", @encrypt.encrypt_message("abc abc ")
  end

  def test_it_can_encrypt_message_with_capital_letters
    assert_equal "dqakdqak", @encrypt.encrypt_message("Abc aBc ")
  end

  def test_it_can_encrypt_message_returning_non_alphabet_characters_as_is
    assert_equal "dqakdqak!", @encrypt.encrypt_message("abc abc !")
  end

  def test_it_can_find_a_letters_index
    assert_equal 2, @encrypt.find_letter_index("c")
  end

  def test_it_can_apply_shift_to_letter
    assert_equal "f", @encrypt.apply_shift_to_letter(3, "c")
  end

end
