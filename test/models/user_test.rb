require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com',
                     password: 'foobar', password_confirmation: 'foobar')
    @event = Event.new(tittle: 'event1', description: 'description',
                       date: '05-02-2020', location: 'location')
  end

  test 'name should be present' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'created event association should exist' do
    @user.save
    assert_difference '@user.created_events.count', 1 do
      @event.creator_id = @user.id
      @event.save
    end
  end

  test 'attended events association should exist' do
    @user.save
    @event.creator_id = @user.id
    @event.save
    @attendanceevent = AttendanceEvent.new(attendee_id: @user.id, attended_event_id: @event.id)
    assert @attendanceevent.save
  end
end
