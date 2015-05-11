# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat do
  it "returns the correct name" do
    stat = Stat.new("My Stat", 100)
    expect(stat.name).to eq("My Stat")
  end

  it "returns the correct value" do
    stat = Stat.new("My Stat", 100)
    expect(stat.value).to eq(100)
  end

  it "returns the correct represenation as a string (to_s())" do
    stat = Stat.new("My Stat", 100)
    expect(stat.to_s).to eq("STATISTIC: My Stat: 100")
  end
end
