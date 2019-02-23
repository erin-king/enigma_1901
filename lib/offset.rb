require 'pry'
require 'date'

class Offset

  attr_reader :date

  def initialize(date)
    @date = format_date(date)
  end

  def format_date(date)
    if date == nil
      date = (Date.today).strftime("%m%d%y")
    end
    date
  end

  def squared_date
    (@date.to_i ** 2).to_s
  end

  def offset_a
    (squared_date[-4]).to_i
  end

  def offset_b
    (squared_date[-3]).to_i
  end

  def offset_c
    (squared_date[-2]).to_i
  end

  def offset_d
    (squared_date[-1]).to_i
  end

end
