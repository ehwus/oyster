class JourneyLog
  attr_reader :journeys

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @journeys << @journey_class.new
    @journeys.last.start = entry_station
  end

  def finish(station)
    @journeys.last.finish = station
  end
end