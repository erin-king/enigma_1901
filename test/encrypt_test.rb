require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def setup
    @encrypt = Encrypt.new("MEAN cats!", "01234", "112982")
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
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
