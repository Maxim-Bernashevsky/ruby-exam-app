class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :file
      t.float :ave_value
      t.integer :theme_id

      t.timestamps null: false
    end
  end
end
