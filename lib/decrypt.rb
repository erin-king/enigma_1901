require 'pry'
require './lib/key'
require './lib/offset'
require './lib/shift'

class Decrypt

  def initialize(key, date)
    @shift = Shift.new(Key.new(key), Offset.new(date))
    @alphabet = ("a".."z").to_a << " "
  end

  def decrypt_cyphertext(cyphertext)
    decryption = []
    counter = 0
    cyphertext.downcase.split(//).each do |letter|
      counter += 1
      if counter == 1
        decryption << apply_shift_to_letter(@shift.shift_a, letter)
      elsif counter == 2
        decryption << apply_shift_to_letter(@shift.shift_b, letter)
      elsif counter == 3
        decryption << apply_shift_to_letter(@shift.shift_c, letter)
      elsif counter == 4
        decryption << apply_shift_to_letter(@shift.shift_d, letter)
        counter = 0
      end
    end
    decryption.join
  end

  def apply_shift_to_letter(shift, letter)
    if find_letter_index(letter) == nil
      return letter
    else
      (@alphabet.rotate(find_letter_index(letter) + (27 - shift))).flatten[0]
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

# def encrypt(message)
#   {
#     encryption: encrypt_message(message),
#     key: shift.key.key,
#     date: shift.offset.date
#   }
# end
#
