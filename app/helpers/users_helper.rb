module UsersHelper
    def attend?(upcoming_event,attended_events)
        x = false
        attended_events.each do |y|
            if y.id == upcoming_event.id
             x = true  
            end
        end
        return !x
    end
end
