class User < ApplicationRecord
    has_many :attendance_events, foreign_key: :attendee_id

    has_many :attended_events, through: :attendance_events

    has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
    has_secure_password


  def upcoming_events
    self.attended_events.where('date > date(\'now\')')
  end

  def previous_events
    self.attended_events.where('date < date(\'now\')')
  end

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
end
