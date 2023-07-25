class PrototypesController < ApplicationController
  before_action :move_to_index, except: [ :index, :show, :destroy, :edit, :new ]
  before_action :move_check, only: [ :edit, :destroy ]
  before_action :authenticate_user!, only: [ :new ]

  def index
    @prototypes = Prototype.includes(:user)
  end
  
  def new
    @prototype = Prototype.new
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def create
    @prototype = Prototype.new(create_params_setting)
    if @prototype.valid?
      @prototype.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def update
    @prototype = Prototype.find(params[:id])
      if @prototype.update(create_params_setting)
        redirect_to action: :show
      else
        render :edit, status: :unprocessable_entity
      end
  end

  private
  def create_params_setting
    params.require(:prototype).permit( :title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_check
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif user_signed_in? && current_user.id != Prototype.find(params[:id]).user_id
      redirect_to action: :index
    end
  end

end
