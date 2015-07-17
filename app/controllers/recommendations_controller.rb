class RecommendationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @recommendations = Recommendation.all
    render :index
  end

  def show
    @recommendation = Recommendation.find(params[:id])
    render :show
  end

  def new
    @recommendation = Recommendation.new
    @recommendation.user_id = current_user.id
    render :new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.user_id = current_user.id
    @recommendation.save
    respond_to do |format|
      format.html {redirect_to '/'}
      format.js
    end
  end

  def edit
      @recommendation = Recommendation.find(params[:id])
      render :edit
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    respond_to do |format|
        format.html {redirect_to '/'}
        format.js
      end
    end

  private
  def recommendation_params
    params.require(:recommendation).permit(:body, :user_id)
  end
end
