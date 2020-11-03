class Oystercard
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :journey_history

  def initialize
    @balance = 0
    @journey = false
    @entry_station = nil
    @journey_history = []
  end

  def top_up(amount)
    check_for_limit(amount)

    change_value(amount)
  end

  def in_journey?
    @journey
  end

  def touch_in(station)
    check_for_minimum
    remember_entry_station(station)

    @journey = true
  end

  def touch_out(station)
    remember_exit_station(station)
    @journey = false
    deduct(MINIMUM_FARE)
  end

  private

  def change_value(amount)
    @balance += amount
  end

  def check_for_minimum
    fail "Not enough money on card to travel, soz." if @balance < MINIMUM_FARE
  end

  def check_for_limit(amount)
    raise "Maximum balance is £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
  end

  def deduct(amount)
    change_value(-amount)
  end

  def remember_entry_station(station)
    @entry_station = station
    @journey_history.push({ :start => station })
  end

  def remember_exit_station(station)
    @journey_history.last[:finish] = station
  end
end
