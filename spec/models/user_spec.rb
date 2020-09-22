require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @email = 'a@a'
    @password = 'aaaabbbb'
    @password_confirmation = 'aaaabbbb'
    @first_name = 'A'
    @last_name = 'A'
  end

  describe 'Validations' do
    it 'creates  a new user when all fields comply and password and password confirmation match' do
      @user = User.new(first_name: @first_name, last_name: @last_name, email: @email, password: @password, password_confirmation: @password_confirmation)
      expect(@user.save).to be true
    end
    it 'does not create a new user when password and password confirmation do not match' do
      @user = User.new(first_name: @first_name, last_name: @last_name, email: @email, password: @password, password_confirmation: 'bbbbaaaaa')
      expect(@user.save).to_not be true
    end
    it 'does not create a new user when email is nil' do
      @user = User.new(first_name: @first_name, last_name: @last_name, email: nil, password: @password, password_confirmation: @password)
      expect(@user.save).to_not be true
    end
    it 'does not create a new user when first name is nil' do
      @user = User.new(first_name: nil, last_name: @last_name, email: @email, password: @password, password_confirmation: @password)
      expect(@user.save).to_not be true
    end
    it 'does not create a new user when last name is nil' do
      @user = User.new(first_name: @first_name, last_name: nil, email: @email, password: @password, password_confirmation: @password)
      expect(@user.save).to_not be true
    end
    it 'does not create a new user when password is less than 6 characters' do
      @user = User.new(first_name: @first_name, last_name: @last_name, email: @email, password: 'a', password_confirmation: 'a')
      expect(@user.save).to_not be true
    end
    it 'does not create a new user when email already exists, regardless of case' do
      @user = User.new(first_name: @first_name, last_name: @last_name, email: @email, password: @password, password_confirmation: @password)
      @user.save
      @userB = User.new(first_name: @first_name, last_name: @last_name, email: 'A@A', password: @password, password_confirmation: @password)
      expect(@userB.save).to_not be true
    end
  end

  describe '.authenticate_with_credentials' do
    it 'confirms user exists and logs in' do
      @user = User.new(first_name: @first_name, last_name: @last_name, email: @email, password: @password, password_confirmation: @password)
      @user.save
      userCapture = User.authenticate_with_credentials(email: @email, password: @password)
      expect(userCapture.email)to_equal @email
      expect(userCapture.first_name)to_equal @first_name
      expect(userCapture.last_name)to_equal @last_name
    end
  end
end
