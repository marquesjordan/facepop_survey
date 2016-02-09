class RemoveAgeGroupFromSurveyAnswers < ActiveRecord::Migration
  def change
    remove_column :survey_answers, :age_group, :integer
  end
end
