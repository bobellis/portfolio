class SkillsController < ApplicationController
  def index
    @skills = Skill.all
    render :index
  end

  def show
    @skill = Skill.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to skill_path
    else
      render :new
    end
  end

  private
  def list_params
    params.require(:skill).permit(:name, :description)
  end
end
