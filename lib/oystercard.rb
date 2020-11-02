class Oystercard
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance is £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE

    change_value(amount)
  end

  def deduct(amount)
    change_value(-amount)
  end

  private
  def change_value(amount)
    @balance += amount
  end
end
