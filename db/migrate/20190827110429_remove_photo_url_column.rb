class RemovePhotoUrlColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :mobfriends, :photo_url, :string
  end
end
