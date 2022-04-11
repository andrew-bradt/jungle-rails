require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should require an email address' do
      @user = User.new(
        first_name: 'andrew',
        last_name: 'bradt',
        email: nil,
        password: 'some password',
        password_confirmation: 'some password'
      )
      @user.save
      expect(@user.id).to_not be_present
    end

    it 'should not create a new user if passwords do not match' do
      @user = User.new(
        first_name: 'andrew',
        last_name: 'bradt',
        email: 'andrewbradt@gmail.com',
        password: 'some password',
        password_confirmation: 'sum password'
      )
      @user.save
      expect(@user.id).to_not be_present
    end
  end
end
