# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat do
  let(:stat) { Stat.new(stat_description, stat_value) }
  subject { stat }
  let(:stat_description) { "My Stat" }
  let(:stat_value) { 100 }
  let(:stat_to_s) { "STATISTIC: #{stat_description}: #{stat_value}" }

  let(:dynamic) do
    puts "This will never get called because there is no explicit call"
    "dynamic"
  end

  let!(:explicit) do
    puts "This will get called"
    "explicit"
  end

  it "returns the correct name" do
    expect(subject.name).to eq(stat_description)
  end

  it "returns the correct value" do
    expect(stat.value).to eq(stat_value)
  end

  it "returns the correct represenation as a string (to_s())" do
    expect(stat.to_s).to eq(stat_to_s)
  end
end
