class ChangeEventConfirmationToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :confirmed, :boolean, default: false
  end
end
