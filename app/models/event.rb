class Event < ApplicationRecord
    has_many :attendance_events, foreign_key: :attended_event_id
    belongs_to :creator, class_name: 'User'
    has_many :attendees, through: :attendance_events

    scope :past, -> { where("date < date('now')") }
    scope :upcoming, -> { where("date > date('now')") }
end
