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

    it 'should require a first name' do
      @user = User.new(
        first_name: nil,
        last_name: 'bradt',
        email: 'andrewbradt@gmail.com',
        password: 'some password',
        password_confirmation: 'some password'
      )

      @user.save
      expect(@user.id).to_not be_present
    end

    it 'should require a last name' do
      @user = User.new(
        first_name: 'andrew',
        last_name: nil,
        email: 'andrewbradt@gmail.com',
        password: 'some password',
        password_confirmation: 'some password'
      )
      
      @user.save
      expect(@user.id).to_not be_present
    end

    it 'should require a password' do
      @user = User.new(
        first_name: 'andrew',
        last_name: 'bradt',
        email: 'andrewbradt@gmail.com',
        password: nil,
        password_confirmation: 'some password'
      )
      
      @user.save
      expect(@user.id).to_not be_present
    end

    it 'should require a password confirmation' do
      @user = User.new(
        first_name: 'andrew',
        last_name: 'bradt',
        email: 'andrewbradt@gmail.com',
        password: 'some password',
        password_confirmation: nil
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

    it 'should not create a user if email has already been used' do
      @user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'test@gmail.com',
        password: 'some-test',
        password_confirmation: 'some-test'
      )

      @user2 = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'test@gmail.com',
        password: 'some-test',
        password_confirmation: 'some-test'
      )

      @user.save
      @user2.save

      expect(@user.id).to be_present
      expect(@user2.id).to_not be_present
    end

    it 'should create a user if password is atleast 6 characters' do
      @user = User.new(
        first_name: 'Tim',
        last_name: 'Johnny',
        email: 'timjohnny@gmail.com',
        password: 'timhasapassword',
        password_confirmation: 'timhasapassword'
      )
      @user.save
      expect(@user.id).to be_present
    end

    it 'should not create a user if password is under 6 characters' do
      @user = User.new(
        first_name: 'Mit',
        last_name: 'Johnny',
        email: 'mitjohnny@gmail.com',
        password: 'bad',
        password_confirmation: 'bad'
      )
      @user.save
      expect(@user.id).to_not be_present
    end
  end


end
