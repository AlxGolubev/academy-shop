class User
  attr_accessor :balance
  attr_reader :name
  def initialize(name, balance)
    @name = name
    @balance = balance
  end
end
