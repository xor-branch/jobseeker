class SkillsController < ApplicationController

  before_action :authenticate_account!
  before_action :set_skill, only: [:index, :edit, :update, :destroy]
  before_action :isJobseeker, only: [:new,:create]


    def index
    end

    def new
      @skill = Skill.new
      respond_to do |format|
       format.js { render "profils/skills/new_skill.js.erb"}
      end
    end
    def create
      @skills = current_account.profil.skills
      @skill = Skill.new(skill_params)
      @skill.profil_id = current_account.profil.id
      respond_to do |format|
        if @skill.save
          format.js { render "profils/skills/skill.js.erb"}
        end
      end
    end

    def edit
      respond_to do |format|
       format.js { render "profils/skills/new_skill.js.erb"}
      end
    end

    def update
      @skills = current_account.profil.skills
      respond_to do |format|
        if @skill.update(skill_params)
          format.js { render "profils/skills/skill.js.erb"}
        end
      end
    end

    def destroy
      @skill.destroy
      redirect_to profils_path
    end

    private
    def set_skill
      @skill = Skill.find(params[:id])
    end
    def skill_params
      params.require(:skill).permit(:name, :description)
    end
end
