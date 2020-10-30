require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com',
                     password: 'foobar', password_confirmation: 'foobar')
    @event = Event.new(tittle: 'event1', description: 'description',
                       date: '05-02-2020', location: 'location')
  end

  test 'creator association should exist' do
    @user.save
    @event.creator_id = @user.id
    @event.save
    assert_not @event.creator_id.nil?
  end

  test 'attendees association should exist' do
    @user.save
    @event.creator_id = @user.id
    @event.save
    @attendanceevent = AttendanceEvent.new(attendee_id: @user.id, attended_event_id: @event.id)
    @attendanceevent.save
    assert_not @event.attendees.empty?
  end
end
