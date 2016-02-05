class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.integer :vote_id
      t.string :question
      t.string :answer

      t.timestamps null: false
    end
  end
end
