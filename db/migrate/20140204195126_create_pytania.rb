class CreatePytania < ActiveRecord::Migration
  def change
    create_table :pytania do |t|
      t.integer :user_id
      t.integer :parent_pytania_id
      t.string :title
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
