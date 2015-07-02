class ProjectsController < ApplicationController
  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.Project.new
  end

  private
    def project_params
        params.require(:project).permit(:name, :descriptions, :link)
    end
end
