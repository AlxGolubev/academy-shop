require 'rspec'
require './user'

RSpec.describe User do
  subject { User.new('John Doe', 100.0) }

  it 'has a name' do
    expect(subject.name).to eq('John Doe')
  end

  it 'has a balance' do
    expect(subject.balance).to eq(100.0)
  end

  it 'can change a balance' do
    subject.balance = 50.0
    expect(subject.balance).to eq(50.0)
  end
end
