require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { described_class.new }

  context 'when checking validations' do
    it 'is not valid without username' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without role' do
      user.role = nil
      expect(user).not_to be_valid
    end

    it 'is valid if user has the role of buyer' do
      user.username = 'test'
      user.first_name = 'test'
      user.last_name = 'test'
      user.email = 'test@gmail.com'
      user.password = 'test'
      user.role = 'buyer'
      user.status = 'none'
      user.broker_role = 'not applied'
      expect(user).to be_valid
    end

    it 'is valid if user has the role of broker' do
      user.username = 'test'
      user.first_name = 'test'
      user.last_name = 'test'
      user.email = 'test@gmail.com'
      user.password = 'test'
      user.role = 'broker'
      user.status = 'approved'
      user.broker_role = 'applied'
      expect(user).to be_valid
    end

    it 'is valid if user has the role of admin' do
      user.username = 'test'
      user.first_name = 'test'
      user.last_name = 'test'
      user.email = 'test@gmail.com'
      user.password = 'test'
      user.role = 'admin'
      user.status = 'approved'
      user.broker_role = 'not applied'
      expect(user).to be_valid
    end
  end
end
