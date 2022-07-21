require './shipping_calculator'

class PriceCalculator
  def initialize(cart)
    @cart = cart
  end

  def cart_price
    @cart.total_price
  end

  def shipping_price
    ShippingCalculator.calculate(@cart.total_volume)
  end

  def total_price
    cart_price + shipping_price
  end


end
