require 'pry'
require './lib/key'
require './lib/offset'
require './lib/shift'

class Encrypt

  attr_reader :shift

  def initialize(message, key, date)
    @message = message.split(//)
    @shift = Shift.new(Key.new(key), Offset.new(date))
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt
    @message
    #turn message into array
    #find index of each message letter
    #rotate message letter by shift
    #return encryption: cyphertext.to_s
    #return key:
    #return date:
  end


end
