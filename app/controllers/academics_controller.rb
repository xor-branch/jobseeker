class AcademicsController < ApplicationController

  before_action :authenticate_account!
  before_action :set_experience, only: [:index, :edit, :update, :destroy]
  before_action :isJobseeker, only: [:new,:create]


    def index
    end

    def new
      @academic = Academic.new
      respond_to do |format|
       format.js { render "profils/academics/new_academic.js.erb"}
      end
    end
    def create
      @academics = current_account.profil.academics
      @academic = Academic.new(academic_params)
      @academic.profil_id = current_account.profil.id
      respond_to do |format|
        if @academic.save
          format.js { render "profils/academics/academic.js.erb"}
        end
      end
    end

    def edit
      respond_to do |format|
       format.js { render "profils/academics/new_academic.js.erb"}
      end
    end

    def update
      @academics = current_account.profil.academics
      respond_to do |format|
        if @academic.update(academic_params)
          format.js { render "profils/academics/academic.js.erb"}
        end
      end
    end

    def destroy
      @academic.destroy
      redirect_to profils_path
    end

    private
    def set_academic
      @academic = Academic.find(params[:id])
    end
    def academic_params
      params.require(:academic).permit(:name, :description, :obtention_year, :school)
    end
end
