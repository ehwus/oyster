require 'oystercard'

describe Oystercard do
  it "initialized with a balance of 0" do
    expect(subject.balance).to eq(0)
  end
end