class CreateAttendanceEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_events do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
