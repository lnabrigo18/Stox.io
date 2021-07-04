require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'login process buyer / admin' do
    let(:user) { User.create(username: 'sample', email: 'sample@gmail.com', password: 'sample', role: 'buyer', status: 'approved', money: 0) }

    before { visit login_path }

    it 'succesfully logs into a admin/buyer account' do
      within 'form' do
        fill_in 'username',	with: user.username
        fill_in 'password',	with: user.password
        click_on 'Login'
      end
      expect(page).to have_current_path login_path
    end
  end

  describe 'login process broker with approved status' do
    let(:user) { User.create(username: 'sample', email: 'sample@gmail.com', password: 'sample', role: 'broker', status: 'approved', money: 0) }

    before { visit login_path }

    it 'succesfully logs into a buyer account' do
      within 'form' do
        fill_in 'username',	with: user.username
        fill_in 'password',	with: user.password
        click_on 'Login'
      end
      expect(page).to have_current_path login_path
    end
  end

  describe 'login process broker with pending status' do
    let(:user) { User.create(username: 'sample', email: 'sample@gmail.com', password: 'sample', role: 'broker', status: 'pending', money: 0) }

    before { visit login_path }

    it 'succesfully logs into a buyer account' do
      within 'form' do
        fill_in 'username',	with: user.username
        fill_in 'password',	with: user.password
        click_on 'Login'
      end
      expect(page).to have_current_path current_path
    end
  end

  describe 'logout process of users' do
    let(:user) { User.create(username: 'sample', email: 'sample@gmail.com', password: 'sample', role: 'buyer', status: 'approved', money: 0) }

    before { visit login_path }

    it 'succesfully logs out from a user account' do
      within 'form' do
        fill_in 'username',	with: user.username
        fill_in 'password',	with: user.password
        click_on 'Login'
      end
      have_link 'Logout', href: logout_path
      expect(page).to have_current_path login_path
    end
  end
end
