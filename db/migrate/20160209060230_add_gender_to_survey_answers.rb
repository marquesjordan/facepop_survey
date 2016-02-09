class AddGenderToSurveyAnswers < ActiveRecord::Migration
  def change
    add_column :survey_answers, :gender, :string
  end
end
