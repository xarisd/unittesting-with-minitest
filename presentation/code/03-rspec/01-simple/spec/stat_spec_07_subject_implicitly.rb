# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat do
  it "returns the correct name" do
    expect(subject.name).to eq("GIVE ME A NAME")
  end

  it "returns the correct value" do
    expect(subject.value).to eq(0)
  end

  it "returns the correct represenation as a string (to_s())" do
    expect(subject.to_s).to eq("STATISTIC: GIVE ME A NAME: 0")
  end
end
