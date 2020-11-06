require 'journeylog'

describe JourneyLog do
  let(:station) { double :station }
  let(:journey) { double :journey, start: station, finish: station }
  let(:journey_class) { double :journey_class, new: journey }

  describe "#start" do
    it "starts a journey" do
      expect(journey_class).to receive(:new)
      expect(journey).to receive(:start=).with(station)
      JourneyLog.new(journey_class).start(station)
    end
  end
end