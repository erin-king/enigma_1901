require 'date'
require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EngimaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_encrypts_message_with_key_and_date
    skip
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_decrypts_message_with_a_key_and_date
    skip
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_encrypts_message_with_key_and_todays_date
    skip
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "042219" #today's date
    }
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_decrypts_message_with_a_key_and_todays_date
    skip
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895" #today's date
    }
    assert_equal expected, enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_encrypts_message_with_generated_random_key_and_todays_date
    skip
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715", #generated random number
      date: "042219" #today's date
    }
    assert_equal expected, enigma.encrypt("hello world")
  end

end
