require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Sign up page', type: :feature do
    describe 'Contents of the signup page' do
      it 'shows the right content in the signup page' do
        visit new_user_path
        expect(page).to have_content('Sign Up')
      end
    end
  end

  describe 'Login in process', type: :feature do
    let(:user) { User.create(name: 'nckop4', email: 'jsjs@jsjsee.com', password: 'passworddd') }
    it 'signs me in' do
      visit login_path
      fill_in 'session_user_id', with: user.id
      click_button 'Submit'
      expect(page).to have_content('events')
    end
  end
end