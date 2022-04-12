require 'rails_helper'

require 'rails_helper'

RSpec.feature "Visitor adds a product to their cart", type: :feature, js: true do
   
  # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add a product to the cart" do
    # ACT
    visit root_path
    find('button', text: 'Add', match: :first).click
   
    # DEBUG / VERIFY
    cart = find('a', text: 'My Cart (1)')
    expect(cart).to be_present
    save_screenshot
  end
end