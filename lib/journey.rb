class Journey
  PENALTY = 6
  MINIMUM = 1

  attr_accessor :start, :finish
  def initialize
    @start = nil
    @finish = nil
  end

  def fare
    journey_invalid? ? give_fare : PENALTY
  end

  def journey_invalid?
    @start.nil? || @finish.nil?
  end

  private

  def give_fare
    (@start.zone - @finish.zone).abs + MINIMUM
  end
end