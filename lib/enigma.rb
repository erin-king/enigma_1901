require 'pry'
require 'date'
require './lib/encryption'
require './lib/decryption'

class Enigma

  def encrypt(message, key = nil, date = nil)
    encryptor = Encrypt.new(key, date)
    encryptor.encrypt(message)
  end

  def decrypt(cyphertext, key, date = nil)
    decryptor = Decrypt.new(key, date)
    decryptor.decrypt(cyphertext)
  end

end
