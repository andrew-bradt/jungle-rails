require 'rails_helper'

RSpec.feature "User Login", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Tim',
      last_name: 'Blancho',
      email: 'timblancho@gmail.com',
      password: 'timblancho99',
      password_confirmation: 'timblancho99'
    )
  end

  scenario "Should be redirected to the root page after a successful login" do
    # ACT
    visit '/login'

    # DEBUG / VERIFY
    within '.form-group' do
      fill_in 'email', with: 'timblancho@gmail.com'
      fill_in 'password', with: 'timblancho99'
      click_on 'Login'
    end

    expect(page).to have_current_path(root_path)
    save_screenshot
  end
end
