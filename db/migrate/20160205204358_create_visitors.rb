class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :age
      t.string :gender
      t.string :email
      t.integer :zip

      t.timestamps null: false
    end
  end
end
