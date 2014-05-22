class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :summary
      t.string :content

      t.timestamps
    end
  end
end