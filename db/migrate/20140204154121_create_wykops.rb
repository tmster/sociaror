class CreateWykops < ActiveRecord::Migration
  def change
    create_table :wykops do |t|
      t.integer :user_id
      t.string :title
      t.text :summary
      t.string :url
      t.integer :status

      t.timestamps
    end
  end
end
