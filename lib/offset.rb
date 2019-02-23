require 'pry'
require 'date'

class Offset

  attr_reader :date

  def initialize(date)
    @date = date
  end

  def format_date(date)
    if date == nil
      date = Date.today
    end
    date
    # return date - this method goes in intialize
  end

end
