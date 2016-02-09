class AddAgeGroupToSurveyAnswers < ActiveRecord::Migration
  def change
    add_column :survey_answers, :age_group, :integer
  end
end
