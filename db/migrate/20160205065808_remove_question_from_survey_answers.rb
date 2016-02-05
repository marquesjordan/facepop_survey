class RemoveQuestionFromSurveyAnswers < ActiveRecord::Migration
  def change
    remove_column :survey_answers, :question, :string
  end
end
