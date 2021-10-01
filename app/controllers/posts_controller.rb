class PostsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_post, only: [:show, :edit, :update]
  layout :resolve_layout

  def index
    @posts = current_account.posts
  end

  def show
    @compagny = @post.account.compagny
    @account_apply = current_account.applies.find_by(post_id: @post.id)  
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id

    if @post.save
      redirect_to @post
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    end
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:category,
                                :title,
                                :description,
                                :jobtype,
                                :deadline,
                                :min_salary, :max_salary,
                                :frequence,
                                :terms_use,
                                :state_id)
  end

  def resolve_layout
    case action_name
    when 'edit', 'show', 'new'
      'home'
    else
      'dashboard'
    end
  end
end
