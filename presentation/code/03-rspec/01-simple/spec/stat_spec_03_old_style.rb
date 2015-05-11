# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat do
  it "returns the correct name" do
    stat = Stat.new("My Stat", 100)
    stat.name.should == "My Stat"
  end

  it "returns the correct value" do
    stat = Stat.new("My Stat", 100)
    stat.value.should == 100
  end

  it "returns the correct represenation as a string (to_s())" do
    stat = Stat.new("My Stat", 100)
    stat.to_s.should == "STATISTIC: My Stat: 100"
  end
end
