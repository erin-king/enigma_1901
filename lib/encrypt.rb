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
    {
      encryption: encrypt_message(message),
      key: shift.key.key,
      date: shift.offset.date
    }
  end

  def encrypt_message(message)
    encryption = []
    counter = 0
    message.downcase.split(//).each do |letter|
      counter += 1
      if counter == 1
        encryption << apply_shift_to_letter(@shift.shift_a, letter)
      elsif counter == 2
        encryption << apply_shift_to_letter(@shift.shift_b, letter)
      elsif counter == 3
        encryption << apply_shift_to_letter(@shift.shift_c, letter)
      elsif counter == 4
        encryption << apply_shift_to_letter(@shift.shift_d, letter)
        counter = 0
      end
    end
    encryption.join
  end

  def apply_shift_to_letter(shift, letter)
    if find_letter_index(letter) == nil
      return letter
    else
      (@alphabet.rotate(shift + find_letter_index(letter))).flatten[0]
    end
  end

  def find_letter_index(letter)
    @alphabet.each_with_index do |alpha, index|
      if alpha == letter
        return index
      end
    end
    return nil
  end

end
