# encoding: utf-8

RSpec.shared_examples "common api" do
  it { expect(subject).to respond_to(:<<) }
  it { expect(subject).to respond_to(:[]) }
  it { expect(subject).to respond_to(:[]=) }
end

RSpec.describe Array do
  include_examples "common api"

  it { expect(subject).to respond_to(:pop) }
  it { expect(subject).to respond_to(:push) }
end

RSpec.describe String do
  include_examples "common api"

  it { expect(subject).to respond_to(:upcase) }
  it { expect(subject).to respond_to(:downcase) }
end
