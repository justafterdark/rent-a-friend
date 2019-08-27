class AddPhotoToMobfriends < ActiveRecord::Migration[5.2]
  def change
    add_column :mobfriends, :photo, :string
  end
end
