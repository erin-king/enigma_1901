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
    message.split(//).each do |letter|
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

  #
  # def encrypt_message(message)
  #   encryption = []
  #   counter = 0
  #   message.split(//).each do |letter|
  #     if counter == 0
  #       encryption << apply_shift_to_letter(@shift.shift_a, letter)
  #     elsif counter == 1
  #       encryption << apply_shift_to_letter(@shift.shift_b, letter)
  #     elsif counter == 2
  #       encryption << apply_shift_to_letter(@shift.shift_c, letter)
  #     elsif counter == 3
  #       encryption << apply_shift_to_letter(@shift.shift_d, letter)
  #     else counter == 4
  #       counter = 0
  #       encryption << apply_shift_to_letter(@shift.shift_a, letter)
  #     end
  #     counter += 1
  #   end
  #   encryption.join
  # end

  def apply_shift_to_letter(shift, letter)
    (@alphabet.rotate(shift + find_letter_index(letter))).flatten[0]
  end

  def find_letter_index(letter)
    @alphabet.each_with_index do |alpha, index|
      if alpha == letter
        return index
      end
    end
  end

end
