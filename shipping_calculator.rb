class ShippingCalculator
  ONE_VOLUME_PRICE = 5.0

  def self.calculate(volume)
    volume * ONE_VOLUME_PRICE
  end
end
