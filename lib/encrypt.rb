require 'pry'
require './lib/key'
require './lib/offset'
require './lib/shift'

class Encrypt

  attr_reader :shift

  def initialize(message, key, date)
    @message = message
    @shift = Shift.new(Key.new(key), Offset.new(date))
  end

end
