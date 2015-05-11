# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat, :model do
  subject { Stat.new("My Stat", 100) }
  context "with values pased", :slow do
    it { expect(subject.name).to eq("My Stat") }
  end
  context "with values pased" do
    it { expect(subject.value).to eq(100) }
    it { expect(subject.to_s).to eq("STATISTIC: My Stat: 100") }
  end
end
