require 'journey'

describe Journey do
  let(:station1) { double :station }
  describe "#start" do
    it "stores the correct start station" do
      subject.start = station1
      expect(subject.start).to eq(station1)
    end

    it "defaults to nil" do
      expect(subject.start).to eq(nil)
    end
  end

  describe "#finish" do
    it "stores the correct finish station" do
      subject.finish = station1
      expect(subject.finish).to eq(station1)
    end

    it "defaults to nil" do
      expect(subject.finish).to eq(nil)
    end
  end

  describe "#fare" do
    it "returns default fare if end and start aren't nil" do
      subject.start = station1
      subject.finish = station1
      expect(subject.fare).to eq(1)
    end

    it "returns penalty fare if both are nil" do
      expect(subject.fare).to eq(6)
    end
  end
end