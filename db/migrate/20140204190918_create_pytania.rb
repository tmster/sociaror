class CreatePytania < ActiveRecord::Migration
  def change
    create_table :pytania do |t|
      t.integer :user_id
      t.string :parent_pytania_idtitle
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
