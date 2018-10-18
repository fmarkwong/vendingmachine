require_relative './vending_machine'
require_relative './product_type'

# drive code to test vending machine
vm = VendingMachine.new
vm.add_product_type(ProductType.new('Coke', 0.75, 'A1'))
vm.add_product_type(ProductType.new('Sprite', 0.75, 'B1'))
vm.add_product_type(ProductType.new('Mountain Dew', 0.75, 'C1'))

vm.stock('Coke', 0)
vm.stock('Sprite', 10)
vm.stock('Mountain Dew', 15)

vm.enter_code('B1')

# puts vm.current_selected_product.name
# puts vm.current_selected_product.quantity

vm.insert_money(1.00)
# vm.cancel
vm.dispense

puts vm.current_selected_product.quantity
puts vm.current_amount

vm.stock('Coke', 5)
puts vm.current_selected_product.quantity
