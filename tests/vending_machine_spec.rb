require 'rspec'
require 'pry-byebug'

require_relative '../vending_machine.rb'
require_relative '../product_type.rb'


# to run tests:
# rspec -c -fd vending_machine_spec.rb

describe VendingMachine do
  describe '#new' do

    subject { VendingMachine.new }
    
    context 'initialization' do
      it 'should not have a current selected product' do
        expect(subject.current_selected_product).to be_nil
      end

      it 'current amount should be 0' do
        expect(subject.current_amount).to eq(0)
      end
    end
  end

  describe 'add product types and stock' do

    subject do
      vm = VendingMachine.new 
      vm.add_product_type(ProductType.new('Coke', 0.75, 'A1'))
      vm.add_product_type(ProductType.new('Sprite', 0.75, 'B1'))
      vm.add_product_type(ProductType.new('Mountain Dew', 0.75, 'C1'))
      vm.stock('Coke', 0)
      vm.stock('Sprite', 10)
      vm.stock('Mountain Dew', 15)
      vm.enter_code('B1')
      vm.insert_money(1.00)
      vm
    end
    
    context 'product selection' do

      it 'should have correct currently selected product' do
        expect(subject.current_selected_product.name).to eq('Sprite')
      end
    end

    context 'insert money' do
      it 'should keep track of current amount' do
        expect(subject.current_amount).to eq(1.0)
      end
    end

    context 'dispense' do
      it 'dispense correct product' do
        retval = 0
        expect { retval = subject.dispense }.to output("Here is your Sprite. Your change is 0.25\n").to_stdout 
        expect(retval).to eq(0.25)
      end
    end
  end
end
