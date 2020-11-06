class Journey
  PENALTY = 6
  MINIMUM = 1

  attr_accessor :start, :finish
  def initialize
    @start = nil
    @finish = nil
  end

  def fare
    journey_valid? ? PENALTY : give_fare
  end

  private

  def journey_valid?
    @start.nil? || @finish.nil?
  end

  def give_fare
    (@start.zone - @finish.zone).abs + MINIMUM
  end
end