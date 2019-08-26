class CreateMobfriends < ActiveRecord::Migration[5.2]
  def change
    create_table :mobfriends do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :tagline
      t.string :bio
      t.integer :age
      t.string :gender
      t.string :language
      t.string :photo_url
      t.integer :hourly_rate

      t.timestamps
    end
  end
end
