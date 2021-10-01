class HomeController < ApplicationController
  layout :resolve_layout
  before_action :authenticate_account!, only: [:compagny, :create_compagny]
  before_action :set_compagny, only: [:mycompagny, :edit_compagny, :update_compagny]


  def homepage
  end


  #browse jobs
  def browse
    @jobs = Post.all
  end

  def mail
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
