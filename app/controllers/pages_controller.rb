class PagesController < ApplicationController
  def home
  	# @questions = Question.where(:active => true)
   #  last_vote = @questions.first.survey_answers.last.vote_id || 0
   #  @current_vote = last_vote + 1;
    @visitor = Visitor.new
  end
end
