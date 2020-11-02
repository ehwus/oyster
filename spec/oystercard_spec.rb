require 'oystercard'

describe Oystercard do
  it "initialized with a balance of 0" do
    expect(subject.balance).to eq(0)
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
end
