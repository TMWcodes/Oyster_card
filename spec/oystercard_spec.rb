require 'oyster_card'

describe Oystercard do
  it "has money on card" do
  expect(subject.balance).to eq(0)
  end
  it "tops up card" do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end
  it "is limited to #{Oystercard::CARD_LIMIT}" do
  subject.top_up(Oystercard::CARD_LIMIT)
  expect { subject.top_up(0.01) }.to raise_error "Sorry, limit is #{Oystercard::CARD_LIMIT}"
  end

  it { is_expected.to respond_to(:deduct)}

  it 'deducts money from the card balance' do
    subject.top_up(10)
    expect { subject.deduct(1) }.to(change{ subject.balance }.by -1)
  end

  it 'in a journey' do
  expect(subject).not_to be_in_journey
  end

  it 'touch in ' do
    subject.top_up(10)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'requires a minimum payment to touch in' do
    balance = subject.balance
    subject.deduct(balance)
    expect{subject.touch_in}.to raise_error("not enough money")
  end

  it 'touch out ' do
    subject.top_up(10)
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey).to eq(false)
  end

  it 'deduct fee from balance' do
  minimum_limit = Oystercard::MINIMUM_LIMIT
  expect{ subject.touch_out }.to change{ subject.balance }.by(-minimum_limit)
  end

end
