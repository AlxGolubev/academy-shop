require 'rspec'
require './product'

RSpec.describe Product do
  let(:width) { 1.0 }
  let(:height) { 1.0 }
  let(:depth) { 1.0 }

  subject { Product.new('Product 1', 10.0, width, height, depth) }

  describe "#volume" do
    it "returns the volume of the product" do
      expect(subject.volume).to eq(1)
    end

    context "when the product is less than 1cm in any dimension" do
      let(:width) { 0.9 }
      let(:height) { 0.9 }
      let(:depth) { 0.9 }

      it "returns 1" do
        expect(subject.volume).to eq(1)
      end
    end
  end
end
