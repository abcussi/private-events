require 'test_helper'

class EventCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: 'Example User', email: 'user@example.com',
                        password: 'foobar', password_confirmation: 'foobar')
  end
  test 'valid create event' do
    log_in_as(@user)
    get new_event_path
    assert_difference 'Event.count', 1 do
      post events_path, params: { event: { title: 'My First event',
                                           description: 'Fun party',
                                           date: '04-10-2020',
                                           location: 'My place' } }
    end
  end
end
