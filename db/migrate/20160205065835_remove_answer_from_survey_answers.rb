class RemoveAnswerFromSurveyAnswers < ActiveRecord::Migration
  def change
    remove_column :survey_answers, :answer, :string
  end
end
