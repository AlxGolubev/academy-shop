require './user'
require './cart'
require './product'
require './price_calculator'
require './shipping_calculator'

class App
  def self.run
    products = [
      Product.new('Product 1', 200.0, 2.0, 1.0, 4.0),
      Product.new('Product 2', 300.0, 3.0, 2.0, 5.0),
      Product.new('Product 3', 500.0, 4.0, 3.0, 6.0)
    ]

    print "How much money do you have? "
    balance = gets.chomp.to_f

    user = User.new('John Doe', balance)

    print "Hey #{user.name}, please pick products from the list below: \n"
    products.each.with_index do |product, index|
      print "#{index}: #{product.title} - #{product.price} \n"
    end

    print "Enter products indices e.g. 1,2,3: "

    user_input = gets.chomp.split(',').map(&:to_i)
    selected_products = user_input.map { |index| products[index - 1] }

    cart = Cart.new(user, selected_products.compact)

    print "Your cart: \n"

    cart.products.each do |product|
      shipping_cost = ShippingCalculator.calculate(product.volume)
      print "#{product.title} - #{product.price}, shipping_cost: #{shipping_cost}\n"
    end

    price_calculator = PriceCalculator.new(cart)

    puts "Cart price: #{price_calculator.cart_price}"
    puts "Shipping price: #{price_calculator.shipping_price}"
    puts "Total price: #{price_calculator.total_price}"

    print "Are you sure you want to buy this cart? (y/n) "
    user_input = gets.chomp
    if user_input == 'n'
      puts "Ok, bye!"
      return
    end

    if user.balance >= price_calculator.total_price
      puts "You have enough money"
      user.balance -= price_calculator.total_price
      puts "Your balance: #{user.balance}"
      puts "Thank you for shopping with us!"
    else
      puts "You don't have enough money, the difference is #{price_calculator.total_price - user.balance}"
    end
  end
end

App.run
