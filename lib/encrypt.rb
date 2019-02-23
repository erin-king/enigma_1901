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
    encryption = []
    message.split(//).each do |letter|
      #new method
    end
    encryption
    #find index of each message letter
    #rotate message letter by shift
    #return encryption: cyphertext.to_s
    #return key:
    #return date:
  end

  def apply_shift_to_letter(shift, letter)

    shifted_letter = @alphabet.rotate(shift + find_letter_index(letter))
    shifted_letter.flatten[0]
  end

  def find_letter_index(letter)
    @alphabet.each_with_index do |alpha, index|
      if alpha == letter
        return index
      end
    end
  end


end

#enum#with_index
