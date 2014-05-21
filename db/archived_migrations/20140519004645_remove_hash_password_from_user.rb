class RemoveHashPasswordFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :hash_password, :string
  end
end
