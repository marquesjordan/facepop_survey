class AddAgeToSurveyAnswers < ActiveRecord::Migration
  def change
    add_column :survey_answers, :age, :string
  end
end
