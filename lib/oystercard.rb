class Oystercard
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    raise "Maximum balance is £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE

    change_value(amount)
  end

  def deduct(amount)
    change_value(-amount)
  end
  
  def in_journey?
    @journey
  end

  def touch_in
    check_for_minimum

    @journey = true
  end

  def touch_out
    @journey = false
  end

  private
  def change_value(amount)
    @balance += amount
  end

  def check_for_minimum
    fail "Not enough money on card to travel, soz." if @balance < MINIMUM_FARE
  end
end
