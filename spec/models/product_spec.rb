require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.new
    end
    it 'Should validate a fully qualified product' do 
      product = Product.new({
      name: "Epic Time Machine",
      quantity: 18,
      price: 124.99,
      category: @category
    })
    product.save    
    expect(product).to be_valid
    end
  
    it 'Not valid when there is no name' do
      product = Product.new({
        quantity: 18,
        price: 124.99,
        category: @category
      })
      product.save    
      expect(product).to_not be_valid
    end

    it 'Not valid when there is no price' do
      product = Product.new({
        name: "Epic Time Machine",
        quantity: 18,
        category: @category
      })
      product.save    
      expect(product).to_not be_valid
    end

    it 'Not valid when there is no quantity' do
      product = Product.new({
        name: "Epic Time Machine",
        price: 124.99,
        category: @category
      })
      product.save    
      expect(product).to_not be_valid
    end

    it 'Not valid when there is no category' do
      product = Product.new({
        name: "Epic Time Machine",
        price: 124.99,
        quantity: 18,
      })
      product.save    
      expect(product).to_not be_valid
    end    
  end
end

