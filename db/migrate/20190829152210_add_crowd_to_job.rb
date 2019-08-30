class AddCrowdToJob < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :crowd, foreign_key: true
  end
end
