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
    counter = 0
    message.split(//).each do |letter|
      if counter == 0 #shift_a
        encryption << apply_shift_to_letter(@shift.shift_a, letter)
      elsif counter == 1 #shift_b
        encryption << apply_shift_to_letter(@shift.shift_b, letter)
      elsif counter == 2 #shift_c
        encryption << apply_shift_to_letter(@shift.shift_c, letter)
      elsif counter == 3 #shift_d
        encryption << apply_shift_to_letter(@shift.shift_d, letter)
      else counter == 4 #reset shift
        counter = 0
        encryption << apply_shift_to_letter(@shift.shift_a, letter)
      end
      counter += 1
    end
    encryption.join
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
