
class Oystercard
attr_accessor :balance, :journey

CARD_LIMIT = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Sorry, limit is #{Oystercard::CARD_LIMIT}" if (balance + amount)>CARD_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @journey
  end

  def touch_in
    @journey = true
    #fail "not enough money" if balance < 1
  end

  def touch_out
    @journey = false
  end
end
