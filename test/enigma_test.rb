require 'date'
require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offset'

class EngimaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_encrypts_a_message
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world", "02715", "040895")
    assert_equal "keder ohulw", encryption[:encryption]
  end

  def test_it_decrypts_a_cyphertext
    enigma = Enigma.new
    decryption = enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal "hello world", decryption[:decryption]
  end

end
