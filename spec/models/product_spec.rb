require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    it 'saves a product with a name, price, quantity and category' do
      @category = Category.new(name: 'Hipster Furniture')
      @product = Product.new(name: 'Hipster Chair', price: 10000, quantity: 9000, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end 
  end
end
