require 'pry'
require './lib/key'
require './lib/offset'
require './lib/shift'

class Encrypt

  def initialize(message, key = nil, date = nil)
    @message = message
    @shift = Shift.new(Key.new(key), Offset.new(date))
  end

end
