require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    before(:each) do
      @category = Category.new(name: 'Hipster Furniture')
      @category.save!
    end

    it 'saves a product with a name, price, quantity and category' do
      @product = @category.products.create(name: 'Hipster Chair', price:10000, quantity: 10000)
      expect(@product.id).to be_present
    end 

    it 'validates :name, presence: true' do
      @product = @category.products.create(name: nil, price: 10000, quantity: 9000)
      expect(@product).to_not be_valid
    end 

    it 'validates :quantity, presence: true' do
      @product = @category.products.create(name: 'Morissey Chair', price: 90000, quantity: nil)
      expect(@product).to_not be_valid
    end

    it 'validates :quantity, presence: true' do
      @product = @category.products.create(name: 'Birthday Party Desk', price: 10000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it 'validates :category, presence: true' do
      @product = Product.new(name: 'Joy Division Stool', price: 10000, quantity: 10, category: nil)
      @product.save
      expect(@product).to_not be_valid
    end
  end
end
