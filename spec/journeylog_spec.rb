require 'journeylog'

describe JourneyLog do
  let(:station) { double :station }
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey }

  describe "#start" do
    it "starts a journey" do
      expect(journey_class).to receive(:new)
      expect(journey).to receive(:start=).with(station)
      JourneyLog.new(journey_class).start(station)
    end
  end

  describe "#finish" do
    it "finishes a journey" do
      test = JourneyLog.new(journey_class)
      allow(journey).to receive(:start=).with(station)
      test.start(station)
      expect(journey).to receive(:finish=).with(station)
      test.finish(station)
    end
  end
end