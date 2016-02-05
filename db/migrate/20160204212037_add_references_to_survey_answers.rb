class AddReferencesToSurveyAnswers < ActiveRecord::Migration
  def change
    add_reference :survey_answers, :question, index: true, foreign_key: true
  end
end
