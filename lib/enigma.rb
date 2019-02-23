require 'pry'
require 'date'
require './lib/encrypt'

class Enigma

  def encrypt(message, key = nil, date = nil)
    encryptor = Encrypt.new(key, date)
    encryptor.encrypt(message)
  end

  def decrypt(cyphertext, key, date = nil)
    #return {cyphertext: "whejdhdh", key: "12345", date: "012219"}
  end

end
