require 'oystercard'

describe Oystercard do
  let(:station){ double :station }
  let(:another_station){ double :station }
  let(:journey) { double :journey, start: nil, finish: nil }

  it "initialized with a balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "initializes not in a journey" do
    expect(subject.in_journey?).to eq false
  end

  describe "#top_up" do
    it "adds to an oyster cards balance" do
      expect { subject.top_up(1) }.to change { subject.balance }.by(1)
    end

    it "raises an error if topup exceeds maximum" do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect { subject.top_up(1) }.to raise_error("Maximum balance is £#{Oystercard::MAX_BALANCE}")
    end
  end           

  # describe "#deduct" do
  #   it "removes from an oyster cards balance" do
  #     expect { subject.deduct(1) }.to change { subject.balance }.by(-1)
  #   end
  # end

  describe "#touch_in" do
    it "changes oyster state to be in_journey? true" do
      card = Oystercard.new
      card.top_up(69)
      card.touch_in(station)
      expect(card.in_journey?).to eq true
    end

    it "won't let you touch in if minimum balance not met" do
      expect{ subject.touch_in(station) }.to raise_error("Not enough money on card to travel, soz.")
    end
  end

  describe "#touch_out" do
    it "changes oyster travel state" do
      card = Oystercard.new
      card.top_up(4.20)
      card.touch_in(station)
      expect(card.in_journey?).to eq true
      card.touch_out(another_station)
      expect(card.in_journey?).to eq false
    end

    it "removes balance by minimum amount" do
      card = Oystercard.new
      card.top_up(69)
      card.touch_in(station)
      card.touch_out(another_station)
      expect(card.balance).to eq(68)
    end

    it "stores last station" do
      subject.top_up(69)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe "#journey_history" do
    it "initializes empty" do
      expect(subject.journey_history).to eq([])
    end

    it "stores the correct entry station" do
      subject.top_up(69)
      subject.touch_in(station)
      expect(subject.journey_history[0][:start]).to eq(station)
    end

    it "stores the correct exit station" do
      subject.top_up(4.20)
      subject.touch_in(station)
      subject.touch_out(another_station)
      expect(subject.journey_history[0][:finish]).to eq(another_station)
    end
  end
end
