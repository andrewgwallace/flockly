class MoveLocationFromUsersToMessages < ActiveRecord::Migration
  def change
    remove_column :users, :location_id, :integer
    add_column :messages, :location_id, :integer
  end
end
