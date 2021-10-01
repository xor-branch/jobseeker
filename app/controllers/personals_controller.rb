class PersonalsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_personal, only: [:index, :edit, :update, :destroy]
  before_action :isJobseeker, only: [:new,:create]

  #personal info
    def index
    end

    def new
      @personal = Personal.new
      respond_to do |format|
       format.js { render "profils/personal/new_personal.js.erb"}
      end
    end
    def create
      @personal = Personal.new(personal_params)
      @personal.profil_id = current_account.profil.id
      respond_to do |format|
        if @personal.save
          format.js { render "profils/personal/personal.js.erb"}
        end
      end
    end

    def edit
      respond_to do |format|
       format.js { render "profils/personal/new_personal.js.erb"}
      end
    end

    def update
      respond_to do |format|
        if @personal.update(personal_params)
          format.js { render "profils/personal/personal.js.erb"}
        end
      end
    end

    def destroy
      @personal.destroy
      redirect_to profils_path
    end

    private
    def set_personal
      @personal = current_account.profil.personal
    end
    def personal_params
      params.require(:personal).permit(:gender, :marital_statut, :children,
                                           :birth_day, :language)
    end

end
