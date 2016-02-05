class AddAnswerRefToSurveyAnswers < ActiveRecord::Migration
  def change
    add_reference :survey_answers, :answer, index: true, foreign_key: true
  end
end
