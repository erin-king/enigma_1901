require 'pry'

class Key

  attr_reader :key

  def initialize(key)
    @key = generate_key(key)
  end

  def generate_key(key)
    if key == nil
      key = rand(99999)
    end
    key.to_s.rjust(5, "0")
  end

end
