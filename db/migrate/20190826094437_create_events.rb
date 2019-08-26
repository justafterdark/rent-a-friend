class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.datetime :datetime
      t.string :type
      t.string :description
      t.string :event_location
      t.string :meeting_location
      t.boolean :confirmed

      t.timestamps
    end
  end
end
