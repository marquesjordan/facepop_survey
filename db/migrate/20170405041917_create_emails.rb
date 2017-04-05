class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
    end
  end
end
