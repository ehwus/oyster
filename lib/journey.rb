class Journey
  attr_accessor :start, :finish
  def initialize
    @start = nil
    @finish = nil
  end

  def fare
    @start.nil? || @finish.nil? ? 6 : 1
  end
end