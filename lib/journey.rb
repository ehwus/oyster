class Journey
  PENALTY = 6
  MINIMUM = 1

  attr_accessor :start, :finish
  def initialize
    @start = nil
    @finish = nil
  end

  def fare
    @start.nil? || @finish.nil? ? PENALTY : (@start.zone - @finish.zone).abs + MINIMUM
  end
end