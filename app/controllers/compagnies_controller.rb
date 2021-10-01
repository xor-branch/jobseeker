class CompagniesController < ApplicationController
  before_action :authenticate_account!
  before_action :isCompagny
  before_action :set_compagny, only: [:index, :edit, :update, :show]
  before_action :haveCompagny, only: [:index]

  layout 'dashboard'

  def index
    puts @compagny
  end

  def new
    @compagny = Compagny.new
  end
  def create
    @compagny = Compagny.new(compagny_params)
    @compagny.account_id = current_account.id
    if @compagny.save
      flash.now[:alert] = "Compagny created sucessfull "
      redirect_to compagnies_path
    end
  end

  def edit
  end

  def update
    if @compagny.update(compagny_params)
      flash.now[:alert] = "Compagny update_compagny sucessfull "
      redirect_to compagnies_path
    end
  end


  private

  def set_compagny
    @compagny = current_account.compagny
  end

  def isCompagny
    if !current_account.entreprise == true
      redirect_to root_path
      flash.now[:danger] = "Vous devez être une conpagny"
    end
  end

  def haveCompagny
    if !@compagny.present?
      redirect_to new_compagny_path
      flash.now[:danger] = "Vous devez renseigner votre conpagny"
    end
  end

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

end
