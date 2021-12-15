
class Oystercard
attr_accessor :balance, :in_journey
MINIMUM_LIMIT = 1
CARD_LIMIT = 100

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Sorry, limit is #{Oystercard::CARD_LIMIT}" if (balance + amount)>CARD_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "not enough money" if @balance < MINIMUM_LIMIT
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
