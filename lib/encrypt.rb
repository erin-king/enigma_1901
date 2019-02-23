require 'pry'
require './lib/key'
require './lib/offset'
require './lib/shift'

class Encrypt

  attr_reader :shift

  def initialize(key, date)
    @shift = Shift.new(Key.new(key), Offset.new(date))
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message)
  #   message.split(//)
  #   letter_index = @alphabet.each_with_index do |letter, index|
  #     if letter == message
  #       return index
  #     end
  #   end
  # end
    @alphabet.rotate(@shift.shift_a + letter_index)
    #find index of each message letter
    #rotate message letter by shift
    #return encryption: cyphertext.to_s
    #return key:
    #return date:
  end

  def find_letter_index(letter)
    # message.split(//)
    @alphabet.each_with_index do |alpha, index|
      if alpha == letter
        return index
      end
    end
  end


end

#enum#with_index
