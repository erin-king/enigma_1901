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
    @date.to_i ** 2
  end

end
