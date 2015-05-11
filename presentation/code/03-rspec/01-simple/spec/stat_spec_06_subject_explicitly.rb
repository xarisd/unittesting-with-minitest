# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat do
  subject { Stat.new("My Stat", 100) }

  it "returns the correct name" do
    expect(subject.name).to eq("My Stat")
  end

  it "returns the correct value" do
    expect(subject.value).to eq(100)
  end

  it "returns the correct represenation as a string (to_s())" do
    expect(subject.to_s).to eq("STATISTIC: My Stat: 100")
  end
end
