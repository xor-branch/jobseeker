class HobbiesController < ApplicationController

  before_action :authenticate_account!
  before_action :set_hobby, only: [:index, :edit, :update, :destroy]
  before_action :isJobseeker, only: [:new,:create]


    def index
    end

    def new
      @hobby = Hobby.new
      respond_to do |format|
       format.js { render "profils/hobbies/new_hobby.js.erb"}
      end
    end

    def create
      @hobbies = current_account.profil.hobbies
      @hobby = Hobby.new(hobby_params)
      @hobby.profil_id = current_account.profil.id
      respond_to do |format|
        if @hobby.save
          format.js { render "profils/hobbies/hobby.js.erb"}
        end
      end
    end

    def edit
      respond_to do |format|
       format.js { render "profils/hobbies/new_hobby.js.erb"}
      end
    end

    def update
      @hobbies = current_account.profil.hobbies
      respond_to do |format|
        if @hobby.update(hobby_params)
          format.js { render "profils/hobbies/hobby.js.erb"}
        end
      end
    end

    def destroy
      @hobby.destroy
      redirect_to profils_path
    end

    private
    def set_hobby
      @hobby = Hobby.find(params[:id])
    end
    def hobby_params
      params.require(:hobby).permit(:name)
    end
end
