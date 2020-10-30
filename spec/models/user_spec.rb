require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'kamil') }

  context 'Validation' do
    it 'it is valid with a name, email and password' do
      user.email = 'jojo@gg.com'
      user.password = 'password'
      expect(user.valid?).to eql(true)
    end

    it 'it is not valid without an email' do
      user.password = 'password'
      expect(user.valid?).to eql(false)
    end

    it 'it is not valid without a password' do
      user.email = 'jojo@gg.com'
      expect(user.valid?).to eql(false)
    end

    it 'it is not valid without a name' do
      user.password = 'password'
      user.email = 'jojo@gg.com'
      user.name = nil
      expect(user.valid?).to eql(false)
    end

    it "create a new person with it's attributes" do
      person = User.new(name: 'John', email: 'jj@jj.com')
      expect(person).to have_attributes(name: 'John')
      expect(person).to have_attributes(email: 'jj@jj.com')
    end
  end

  context 'Associations' do
    it { should have_many(:created_events).with_foreign_key('creator_id') }
  end
end
