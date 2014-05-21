class RemoveUserIdFromLocationMessageIdFromUserLocationIdFromMessage < ActiveRecord::Migration
  def change
    remove_column :locations, :user_id, :integer
    remove_column :messages, :location_id, :integer
    # remove_column :users, :message_id, :integer
  end
end
