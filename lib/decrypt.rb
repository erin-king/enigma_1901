require 'pry'
require './lib/key'
require './lib/offset'
require './lib/shift'

class Decrypt

  def initialize(key, date)
    @shift = Shift.new(Key.new(key), Offset.new(date))
    @alphabet = ("a".."z").to_a << " "
  end

  
end
