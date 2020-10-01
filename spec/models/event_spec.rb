require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(name: 'keller', email: 'jsjs@jsjsee.com', password: 'passworddd') }
  let(:event) { user.created_events.build(tittle: 'my first event', description: 'best event of the year', date: '2020-07-09', location: 'London') }

  context 'Validation' do
    it 'ensures the user is signed in and the event has a creator' do
      expect(event.valid?).to eql(true)
    end

    it 'it is invalid if user is not signed in' do
      event.creator_id = 5
      expect(event.valid?).to eql(false)
    end

    it "create an event with it's attributes" do
      event.tittle = 'first event'
      expect(event).to have_attributes(tittle: 'first event')
    end

    it 'Should validates presence of tittle' do
      event.tittle = nil
      expect(event.valid?).to eql(false)
    end

    it 'Should validates presence of date' do
      event.date = nil
      expect(event.valid?).to eql(false)
    end
  end

  context 'Associations' do
    it { should belong_to(:creator).class_name('User') }
  end
end
