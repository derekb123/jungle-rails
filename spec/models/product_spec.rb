require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'creates a product when all necessary fields are filled' do
      @category = Category.new(name: "Cat1")
      @product = Product.new(name: "twizzler dispenser", price_cents: 100, quantity: 2,category: @category)
      expect(@product.save).to be true
    end
    it 'stops a product from being created that does not have a name' do
      @category = Category.new(name: "Cat1")
      @product = Product.new(name: nil, price_cents: 100, quantity: 2,category: @category)
      expect(@product.save).not_to be true
    end
    it 'stops a product from being created that does not have a price' do
      @category = Category.new(name: "Cat1")
      @product = Product.new(name: "monkey hands", price_cents: nil, quantity: 2,category: @category)
      expect(@product.save).not_to be true
    end
    it 'stops a product from being created that does not have a quantity' do
      @category = Category.new(name: "Cat1")
      @product = Product.new(name: "fake deoderant", price_cents: 100, quantity: nil,category: @category)
      expect(@product.save).not_to be true
    end
    it 'stops a product from being created that does not have a vategory' do
      @category = Category.new(name: "Cat1")
      @product = Product.new(name: "fake deoderant", price_cents: 100, quantity: 4,category: nil)
      expect(@product.save).not_to be true
    end
  end
end
