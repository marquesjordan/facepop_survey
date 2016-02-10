class SurveyAnswersController < ApplicationController
  before_action :set_survey_answer, only: [:show, :edit, :update, :destroy]

  # GET /survey_answers
  # GET /survey_answers.json
  def index
    @questions = Question.where(:active => true)
    @survey_answers = SurveyAnswer.all
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
    visitor = Visitor.last 

    @survey_answer.gender = visitor.gender
    @survey_answer.age = visitor.age
    respond_to do |format|
      if @survey_answer.save

        cur_question = Question.find(params[:question_id])
        cur_answer = Answer.find(params[:answer_id])
        cur_question.votes += 1
        cur_answer.votes += 1
        cur_question.save
        cur_answer.save

        format.html { redirect_to @survey_answer, notice: 'Survey answer was successfully created.' }
        format.json { render :show, status: :created, location: @survey_answer }
        format.js
      else
        format.html { redirect_to root_path, notice: 'Must Complete The Following Before The Survey.' }
        format.json { render json: @survey_answer.errors, status: :unprocessable_entity }
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
      params.require(:survey_answer).permit(:vote_id, :question_id, :answer_id, :gender, :age)
    end
end
