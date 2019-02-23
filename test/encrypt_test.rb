require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

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

  def test_it_can_find_a_letters_index
    assert_equal 2, @encrypt.find_letter_index("c")
  end

  def test_it_can_apply_shift_to_letter
    assert_equal "f", @encrypt.apply_shift_to_letter(3, "c")
  end

end

#tests
#with all arguments provided
#with no date
#with no key
#with no key or date
#message with capital letters "MEAN cats"
#message with characters "MEAN cats!"

# def encrypt(message, key = nil, date = nil)
#   #return {encryption: "blahblah", key: "12345", date: "012219"}
# end
#
# def test_it_encrypts_message_with_key_and_date
#   skip
#   enigma = Enigma.new
#
#   expected = {
#     encryption: "keder ohulw",
#     key: "02715",
#     date: "040895"
#   }
#   assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
# end
