class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :user_id
      t.integer :image_id
      t.integer :value

      t.timestamps null: false
    end
  end
end
