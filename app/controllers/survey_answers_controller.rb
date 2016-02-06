class SurveyAnswersController < ApplicationController
  before_action :set_survey_answer, only: [:show, :edit, :update, :destroy]

  # GET /survey_answers
  # GET /survey_answers.json
  def index
    #@survey_answers = SurveyAnswer.all
    @questions = Question.where(:active => true)
    last_vote = @questions.first.survey_answers.last.vote_id
    @current_vote = last_vote + 1;
    @visitor = Visitor.new
  end

  # GET /survey_answers/1
  # GET /survey_answers/1.json
  def show

  end

  # GET /survey_answers/new
  def new
    @survey_answer = SurveyAnswer.new(survey_answer_params)
  end

  # GET /survey_answers/1/edit
  def edit
  end

  # POST /survey_answers
  # POST /survey_answers.json
  def create
    @survey_answer = SurveyAnswer.new(:vote_id => params[:vote_id], :question_id => params[:question_id], :answer_id => params[:answer_id])

    respond_to do |format|
      if @survey_answer.save
        format.html { redirect_to @survey_answer, notice: 'Survey answer was successfully created.' }
        format.json { render :show, status: :created, location: @survey_answer }
        format.js
      else
        format.html { render :new }
        format.json { render json: @survey_answer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /survey_answers/1
  # PATCH/PUT /survey_answers/1.json
  def update
    respond_to do |format|
      if @survey_answer.update(survey_answer_params)
        format.html { redirect_to @survey_answer, notice: 'Survey answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_answer }
      else
        format.html { render :edit }
        format.json { render json: @survey_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_answers/1
  # DELETE /survey_answers/1.json
  def destroy
    @survey_answer.destroy
    respond_to do |format|
      format.html { redirect_to survey_answers_url, notice: 'Survey answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_answer
      @survey_answer = SurveyAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_answer_params
      params.require(:survey_answer).permit(:vote_id, :question_id, :answer_id)
    end
end
