class RemoveColumns < ActiveRecord::Migration

  def self.up
    remove_column :location, :lat
    remove_column :location, :lng
  end

  def change
  end
end
