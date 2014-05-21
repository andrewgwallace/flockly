class RemoveLatFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :lat, :decimal
  end
end
