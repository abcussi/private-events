module UsersHelper
  def attend?(upcoming_event, attended_events)
    x = false
    attended_events.each do |y|
      x = true if y.id == upcoming_event.id
    end
    !x
  end
end
