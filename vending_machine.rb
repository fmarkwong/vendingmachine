require_relative './product_type'
require 'pry-byebug'

class VendingMachine

  attr_reader :current_selected_product, :current_amount

  def initialize
    @current_amount = 0
    @product_type = {}
  end

  def add_product_type(product_type)
    @product_type[product_type.name] = product_type 
  end

  def stock(product_name, quantity)
    @product_type[product_name].add(quantity)
  end

  def enter_code(code)
    @current_selected_product = @product_type.select { |k,v| v.code === code }.values.first 
    if @current_selected_product.quantity === 0
      puts "Sorry, we are out of #{@current_selected_product.name}. Please select another product."
      @current_selected_product = nil
    end
  end

  def insert_money(amount)
    @current_amount += amount
  end

  def cancel
    balance = @current_amount
    @current_amount = 0
    puts "Here is your #{balance}"
    return balance 
  end

  def dispense
    if ! @current_selected_product
      puts "Please enter a product code"
      return
    end

    if @current_amount < @current_selected_product.price
      puts "Please add #{current_selected_product.price - @current_amount}"
      return
    end

    @current_amount -= @current_selected_product.price
    @current_selected_product.decrease_one
    if @current_amount > 0
      puts "Here is your #{@current_selected_product.name}. Your change is #{@current_amount}"
      change = @current_amount
      @current_amount = 0
    else
      puts "Here is your #{@current_selected_product.name}"
      change = 0 
    end

    return change
  end

end
