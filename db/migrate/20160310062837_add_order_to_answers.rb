class AddOrderToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :order, :integer, :default => 0
  end
end
