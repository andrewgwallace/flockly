class AddMessageIdToLocations < ActiveRecord::Migration
  def change

    add_column :locations, :message_id, :integer
  end
end
