require 'journey'

describe Journey do
  let(:station1) { double :station, zone: 1 }
  let(:station2) { double :station, zone: 2 }
  let(:station3) { double :station, zone: 3 }
  let(:station4) { double :station, zone: 4 }


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

    it "returns correct fare for two different zones" do
      test = Journey.new
      test.start = station1
      test.finish = station2
      expect(test.fare).to eq(2)
    end

    it "works going from high station to low station" do
      test = Journey.new
      test.start = station4
      test.finish = station1
      expect(test.fare).to eq(4)
    end
  end
end
