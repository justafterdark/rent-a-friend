class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :event, foreign_key: true
      t.references :mobfriend, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
