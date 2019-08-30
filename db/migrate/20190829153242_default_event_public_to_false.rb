class DefaultEventPublicToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :public, :boolean, default: false
  end
end
