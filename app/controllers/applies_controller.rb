class AppliesController < ApplicationController
  before_action :authenticate_account!
  before_action :isJobseeker, only: [:create]

  def create
    #respond_to do |format|
      account_apply = current_account.applies.create(post_id: params[:post_id])
      #format.js { render "posts/apply_button.js.erb"}
      redirect_to request.referrer
   #end
  end

  def destroy
    account_apply = current_account.applies.find_by(id: params[:post_id]).destroy
    redirect_to request.referrer
  end


end
