class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :resolution]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all.order(updated_at: :desc).page(params[:page]).per(20)
    if user_signed_in?
      tag_id = Tag.often_use_tag(current_user)
      @recommended_questions = Question.top_3_recommended(tag_id)
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @recommended_questions = Question.top_3_recommended(@question.taggings.first.tag_id) if @question.taggings.present?
    if user_signed_in?
      @answer = @question.answers.build(user_id: current_user.id)
    end
    @answers = @question.answers.order(updated_at: :desc)
  end

  # GET /questions/new
  def new
    @question = Question.new
    @tags = Tag.all
  end

  # GET /questions/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.save
    @question.taggings.create(params[:tag][:id].map{ |t| {tag_id: t} } )
    redirect_to @question, notice: '質問を投稿しました。'
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if @question.update(question_params)
      redirect_to @question, notice: '質問を更新しました。'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: '質問を削除しました。' }
      format.json { head :no_content }
    end
  end

  def resolution
    if @question.is_resolution?
      @question.is_resolution = false
      @question.resolved_at = nil
    else
      @question.is_resolution = true
      @question.resolved_at = Time.current
    end
    if @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      if params[:action] != "resolution"
        params.require(:question).permit(:title, :content, :is_resolution, :user_id)
      end
    end
end
