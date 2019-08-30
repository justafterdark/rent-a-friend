class CreateCrowds < ActiveRecord::Migration[5.2]
  def change
    create_table :crowds do |t|
      t.references :event, foreign_key: true
      t.integer :size

      t.timestamps
    end
  end
end
