class ExperiencesController < ApplicationController

  before_action :authenticate_account!
  before_action :set_experience, only: [:index, :edit, :update, :destroy]
  before_action :isJobseeker, only: [:new,:create]


    def index
    end

    def new
      @experience = Experience.new
      respond_to do |format|
       format.js { render "profils/experiences/new_experience.js.erb"}
      end
    end
    def create
      @experiences = current_account.profil.experiences
      @experience = Experience.new(experience_params)
      @experience.profil_id = current_account.profil.id
      respond_to do |format|
        if @experience.save
          format.js { render "profils/experiences/experience.js.erb"}
        end
      end
    end

    def edit
      respond_to do |format|
       format.js { render "profils/experiences/new_experience.js.erb"}
      end
    end

    def update
      @experiences = current_account.profil.experiences
      respond_to do |format|
        if @experience.update(experience_params)
          format.js { render "profils/experiences/experience.js.erb"}
        end
      end
    end

    def destroy
      @experience.destroy
      redirect_to profils_path
    end

    private
    def set_experience
      @experience = Experience.find(params[:id])
    end
    def experience_params
      params.require(:experience).permit(:name, :description, :duration)
    end
end
