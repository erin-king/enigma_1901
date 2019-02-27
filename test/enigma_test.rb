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

  def test_it_encrypts_a_message_with_a_key_and_date
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world", "02715", "040895")
    assert_equal "keder ohulw", encryption[:encryption]
  end

  def test_it_decrypts_a_cyphertext_with_a_key_and_date
    enigma = Enigma.new
    decryption = enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal "hello world", decryption[:decryption]
  end

  def test_it_encrypts_a_message_with_key_and_uses_todays_date_then_decrypts
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world", "02715")

    cyphertext = encryption[:encryption]
    decrypt_key = encryption[:key]
    decrypt_date = encryption[:date]

    decryption = enigma.decrypt(cyphertext, decrypt_key, decrypt_date)

    expected_date = (Date.today).strftime("%m%d%y")

    assert_equal "hello world", decryption[:decryption]
    assert_equal "02715", decryption[:key]
    assert_equal expected_date, decryption[:date]
  end

  def test_it_encrypts_a_message_with_random_generated_key_and_uses_todays_date_then_decrypts
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world")

    cyphertext = encryption[:encryption]
    decrypt_key = encryption[:key]
    decrypt_date = encryption[:date]

    decryption = enigma.decrypt(cyphertext, decrypt_key, decrypt_date)

    expected_date = (Date.today).strftime("%m%d%y")

    assert_equal "hello world", decryption[:decryption]
    assert_equal encryption[:key], decryption[:key]
    assert_equal expected_date, decryption[:date]
  end

  # def test_it_decrypts_a_cyphertext_with_a_key_and_uses_todays_date
  #   enigma = Enigma.new
  #   decryption = enigma.decrypt("keder ohulw", "02715", "040895")
  #   assert_equal "hello world", decryption[:decryption]
  # end

end
