class RemoveVoteRatioFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :vote_ratio, :float
  end
end
