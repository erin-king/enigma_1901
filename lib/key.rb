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

  def key_a
    ("#{@key[0]}#{@key[1]}").to_i
  end

  def key_b
    ("#{@key[1]}#{@key[2]}").to_i
  end

  def key_c
    ("#{@key[2]}#{@key[3]}").to_i
  end

  def key_d
    ("#{@key[3]}#{@key[4]}").to_i
  end


end
