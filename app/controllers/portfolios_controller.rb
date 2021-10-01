class PortfoliosController < ApplicationController

  before_action :authenticate_account!
  before_action :set_portfolio, only: [:index, :edit, :update, :destroy]
  before_action :isJobseeker, only: [:new,:create]


    def index
    end

    def new
      @portfolio = Portfolio.new
      respond_to do |format|
       format.js { render "profils/portfolios/new_portfolio.js.erb"}
      end
    end
    def create
      @portfolios = current_account.profil.portfolios
      @portfolio = Portfolio.new(portfolio_params)
      @portfolio.profil_id = current_account.profil.id
      respond_to do |format|
        if @portfolio.save
          format.js { render "profils/portfolios/portfolio.js.erb"}
        end
      end
    end

    def edit
      respond_to do |format|
       format.js { render "profils/portfolios/new_portfolio.js.erb"}
      end
    end

    def update
      @portfolios = current_account.profil.portfolios
      respond_to do |format|
        if @portfolio.update(portfolio_params)
          format.js { render "profils/portfolios/portfolio.js.erb"}
        end
      end
    end

    def destroy
      @portfolio.destroy
      redirect_to profils_path
    end

    private
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end
    def portfolio_params
      params.require(:portfolio).permit(:name, :description, :portfolio_link)
    end
end
