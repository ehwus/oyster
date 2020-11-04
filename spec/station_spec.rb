require 'station'

describe Station do
  let(:station) { Station.new("Name", 1) }
  it "initializes with a name" do
    expect(station.name).to eq("Name")
  end

  it "initializes with a zone" do
    expect(station.zone).to eq(1)
  end
end