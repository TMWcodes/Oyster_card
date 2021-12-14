
class Oystercard
attr_accessor :balance
DEFAULT_LIMIT = 90
  def initialize
    @balance = 0

  end

  def top_up(amount)
    fail "Sorry, limit is #{Oystercard::DEFAULT_LIMIT}" if (balance + amount)>DEFAULT_LIMIT
    @balance += amount
  end

end
