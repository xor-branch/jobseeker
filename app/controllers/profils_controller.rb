class ProfilsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_profil, only: [:index, :edit, :update]
  before_action :isJobseeker, only: [:new,:create]
  before_action :haveProfile, only: [:index]
  layout :resolve_layout

  # profil
  def index
    @lastest_job = Post.all.limit(4)
    @personal = @profil.personal
    @skills = @profil.skills
    @experiences = @profil.experiences
    @academics = @profil.academics
    @portfolios = @profil.portfolios
    @hobbies = @profil.hobbies
  end

  def new
    @profil = Profil.new
  end

  def create
    @profil = Profil.new(profil_params)
    @profil.account_id = current_account.id

    if @profil.save
      redirect_to profils_path
      flash[:succes] = "Your profile is susccefully update"
    end
  end

  def edit
  end
  def update
    if @profil.update(profil_params)
      redirect_to @profil
      flash[:succes] = "Your profile is susccefully update"
    end
  end

  def show
    @lastest_job = Post.all.limit(4)
    @profil = Profil.find(params[:id])
    @personal = @profil.personal
    @skills = @profil.skills
    @experiences = @profil.experiences
    @academics = @profil.academics
    @portfolios = @profil.portfolios
    @hobbies = @profil.hobbies
  end

  private

  def set_profil
    @profil = current_account.profil
  end
  def profil_params
    params.require(:profil).permit(:name,:avatar,:telephone,:bio,
                                      :speciality,:state_id,:country_id,
                                      :facebook,:twitter,:linkedin,:github)
  end

  def resolve_layout
    case action_name
    when 'new', 'edit', 'index', 'show'
      'home'
    else
      'profil'
    end
  end
end
