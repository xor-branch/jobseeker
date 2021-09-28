class HomeController < ApplicationController
  layout :resolve_layout
  before_action :authenticate_account!, only: [:compagny, :create_compagny]
  before_action :set_compagny, only: [:mycompagny, :edit_compagny, :update_compagny]


  def homepage
  end

  def mycompagny

  end

  def new_compagny
    @compagny = Compagny.new
  end

  def create_compagny
    @compagny = Compagny.new(compagny_params)
    @compagny.account_id = current_account.id
    if @compagny.save
      flash.now[:alert] = "Compagny created sucessfull "
      redirect_to mycompagny_path
    end
  end

  def edit_compagny
  end

  def update_compagny
    if @compagny.update(compagny_params)
      flash.now[:alert] = "Compagny update_compagny sucessfull "
      redirect_to mycompagny_path
    end
  end

  def mail
  end


  #liste of jobs
  def jobs
  end

  # create job
  def create_job
  end

  #show_job
  def show_job
  end

  #show_job
  def show_job
  end

  #browse jobs
  def browse
  end

  private
  def compagny_params
    params.require(:compagny).permit(:name,
                                     :logo,
                                     :description,
                                     :country_id,
                                     :state_id,
                                     :website,
                                     :facebook,
                                     :linkedin,
                                     :twitter)
  end
  def set_compagny
    @compagny = Compagny.find_by(account_id: current_account.id)
  end
  def isCompagny!
    if current_account.compagny
      redirect_to root_path
      flash.now[:danger] = "Vous devez être une conpagny"
  end
  end
  def haveCompagny!
    if !current_account.compagny.title.present? && !current_account.compagny.description.present?
      redirect_to compagny_path
      flash.now[:danger] = "Vous devez renseigner votre conpagny"
    end
  end


  def resolve_layout
    case action_name
    when 'homepage', 'create_job', 'show_job', 'browse'
      'home'
    else
      'dashboard'
    end
  end

end
