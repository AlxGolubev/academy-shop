class Product
  attr_reader :price, :title

  def initialize(title, price, width, height, depth)
    @title = title
    @price = price
    @width = width
    @height = height
    @depth = depth
  end

  def volume
    volume = @width * @height * @depth

    volume < 1 ? 1 : volume
  end
end
