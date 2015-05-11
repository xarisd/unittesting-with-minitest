# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat do
  before do
    @stat = Stat.new("My Stat", 100)
  end

  it "returns the correct name" do
    expect(@stat.name).to eq("My Stat")
  end

  it "returns the correct value" do
    expect(@stat.value).to eq(100)
  end

  it "returns the correct represenation as a string (to_s())" do
    expect(@stat.to_s).to eq("STATISTIC: My Stat: 100")
  end
end
