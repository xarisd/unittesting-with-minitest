# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat do
  describe "default values" do
    it { expect(subject.name).to eq("GIVE ME A NAME") }
    it { expect(subject.value).to eq(0) }
    it { expect(subject.to_s).to eq("STATISTIC: GIVE ME A NAME: 0") }
  end

  context "with values pased" do
    subject { Stat.new("My Stat", 100) }
    it { expect(subject.name).to eq("My Stat") }
    it { expect(subject.value).to eq(100) }
    it { expect(subject.to_s).to eq("STATISTIC: My Stat: 100") }
  end
end
