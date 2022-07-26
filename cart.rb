class Cart
  attr_reader :products

  def initialize(user, products)
    @user = user
    @products = products
  end

  def total_price
    @products.inject(0) do |sum, product|
      sum + product.price
    end
  end

  def total_volume
    @products.inject(0) do |volume, product|
      volume + product.volume
    end
  end
end
