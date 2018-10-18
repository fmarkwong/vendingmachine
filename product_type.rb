class ProductType

  attr_reader :name, :quantity, :price, :code

  def initialize(name, price, code)
    @name = name
    @price = price
    @code = code
    @quantity = 0
  end

  def add(quantity)
    @quantity += quantity
  end

  def decrease_one
    @quantity -= 1
  end
end
