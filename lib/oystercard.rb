require 'journey'
require 'journeylog'

class Oystercard
  MAX_BALANCE = 90
  PENALTY = 6
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :journey_history

  def initialize(history_class = JourneyLog)
    @balance = 0
    @entry_station = nil
    @journey_history = history_class.new
  end

  def top_up(amount)
    check_for_limit(amount)

    change_value(amount)
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    check_for_penalty unless @journey_history.journeys.empty?
    check_for_minimum
    remember_entry_station(station)
  end

  def touch_out(station)
    if @entry_station.nil?
      @balance -= PENALTY
      return
    end
    remember_exit_station(station)
  end

  private

  def change_value(amount)
    @balance += amount
  end

  def check_for_minimum
    raise 'Not enough money on card to travel, soz.' if @balance < MINIMUM_FARE
  end

  def check_for_limit(amount)
    raise "Maximum balance is £#{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
  end

  def deduct(amount)
    change_value(-amount)
  end

  def remember_entry_station(station)
    @entry_station = station
    @journey_history.start(station)
  end

  def remember_exit_station(station)
    @journey_history.finish(station)
    @entry_station = nil
    deduct(MINIMUM_FARE)
  end

  def check_for_penalty
    @balance -= PENALTY if @journey_history.journeys.last.journey_invalid?
  end
end
