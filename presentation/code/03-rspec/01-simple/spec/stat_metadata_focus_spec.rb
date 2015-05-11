# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat, :model do
  context "with values pased", :focus do
    subject { Stat.new("My Stat", 100) }
    it { expect(subject.name).to eq("My Stat") }
    it { expect(subject.value).to eq(100) }
    it { expect(subject.to_s).to eq("STATISTIC: My Stat: 100") }
  end
end
