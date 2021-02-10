require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should save" do
      @cat = Category.new(name: 'test')
      @product = Product.new(name: "name", price: 100, quantity: 1, category: @cat)
      @product.save
      expect(@product.save).to be true
    end
    it "should have a name" do
      @cat = Category.new(name: 'test')
      @product = Product.new(name: "name", price: 100, quantity: 1, category: @cat)
      @product.save
      expect(@product.name).to be_present
    end
    it "should have a name" do
      @cat = Category.new(name: 'test')
      @product = Product.new(name: "test", price: 100, quantity: 1, category: @cat)
      @product.save
      expect(@product.price).to be_present
    end
    it "should have a name" do
      @cat = Category.new(name: 'test')
      @product = Product.new(name: "test", price: 100, quantity: 1, category: @cat)
      @product.save
      expect(@product.quantity).to be_present
    end
    it "should have a name" do
      @cat = Category.new(name: 'test')
      @product = Product.new(name: "test", price: 100, quantity: 1, category: @cat)
      @product.save
      expect(@product.category).to be_present
    end
  end
end
