class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.integer :user_id
      t.string :title
      t.text :summary
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
