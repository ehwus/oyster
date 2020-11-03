require 'oystercard'

describe Oystercard do
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

  describe "#deduct" do
    it "removes from an oyster cards balance" do
      expect { subject.deduct(1) }.to change { subject.balance }.by(-1)
    end
  end

  describe "#touch_in" do
    it "changes oyster state to be in_journey? true" do
      card = Oystercard.new
      card.top_up(69)
      card.touch_in
      expect(card.in_journey?).to eq true
    end

    it "won't let you touch in if minimum balance not met" do
      expect{ subject.touch_in }.to raise_error("Not enough money on card to travel, soz.")
    end

    it "changes oyster state twice" do
      card = Oystercard.new
      card.top_up(4.20)
      card.touch_in
      expect(card.in_journey?).to eq true
      card.touch_out
      expect(card.in_journey?).to eq false
    end
  end
end
