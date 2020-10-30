class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :tittle
      t.text :description
      t.string :location
      t.integer :creator_id
      t.datetime :date

      t.timestamps
    end
  end
end
