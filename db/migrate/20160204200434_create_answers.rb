class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :votes, default: 0
      t.float :vote_ratio, default: 0.0

      t.timestamps null: false
    end
  end
end
