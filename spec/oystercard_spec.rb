require 'oyster_card'

describe Oystercard do
  it "has money on card" do
  expect(subject.balance).to eq(0)
  end
  it "tops up card" do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end
  it "is limited to #{Oystercard::DEFAULT_LIMIT}" do
  subject.top_up(Oystercard::DEFAULT_LIMIT)
  expect { subject.top_up(0.01) }.to raise_error "Sorry, limit is #{Oystercard::DEFAULT_LIMIT}"
  end
end
