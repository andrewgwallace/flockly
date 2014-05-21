class RemoveLngFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :lng, :decimal
  end
end
