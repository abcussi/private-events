require 'rails_helper'

RSpec.describe Event, type: :feature do
  let(:user) { User.create(name: 'joper', email: 'jsjs@jsjsee.com', password: 'passworddd', password_confirmation: 'passworddd') }
  let(:event) { user.created_events.build(tittle: 'my first event reloaded', description: 'most fun filled event ever made', location: 'Los Angeless', date: '2020-07-09') }

  describe 'Load events index page', type: :system do
    describe 'Contents of the index page' do
      it 'shows the right content in the index page' do
        visit events_path
        expect(page).to have_content('events')
      end
    end
  end

  describe 'Event creation process', type: :feature do
    it 'create an event' do
      visit login_path
      fill_in 'session_user_id', with: user.id
      click_button 'Submit'
      expect(page).to have_content('events')
    end
  end
end