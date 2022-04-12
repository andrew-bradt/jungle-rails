require 'rails_helper'

RSpec.feature "Visitor navigates to a product page", type: :feature, js: true do
   
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

  scenario "They are redirected to a specific product page after clicking the product" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    find('article.product a', match: :first).click
    expected_path = "/products/#{@category.products.last[:id]}"
    expect(page).to have_css 'section.products-show'
    expect(page).to have_current_path(expected_path)
    save_screenshot
  end

end