require 'rspec'
require './cart'
require './product'
require './user'

RSpec.describe Cart do
  let(:user) { User.new('John Doe', 100.0) }
  let(:products) do
    [
      Product.new('Product 1', 10.0, 1.0, 1.0, 1.0),
      Product.new('Product 2', 20.0, 2.0, 2.0, 2.0)
    ]
  end

  subject { Cart.new(user, products) }

  describe '#products' do
    it 'returns the products' do
      expect(subject.products).to eq(products)
    end
  end

  describe '#total_price' do
    it 'returns the total price' do
      expect(subject.total_price).to eq(30.0)
    end
  end

  describe '#total_volume' do
    it 'returns the total volume' do
      expect(subject.total_volume).to eq(9.0)
    end
  end
end
