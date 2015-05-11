# encoding: utf-8
require_relative "../stat"

RSpec.describe Stat do
  subject { Stat.new("My Stat", 100) }

  it "is super awesome but it is still pending"

  context "with values pased" do
    xit { expect(subject.value).to eq(100) }
    it { expect(subject.to_s).to eq("STATISTIC: My Stat: 100") }
  end

  context "with values pased" do
    it do
      pending "Something is wrong with the algorithm, bug #43"
      expect(subject.name).to eq("My Stat2")
    end
  end
end
