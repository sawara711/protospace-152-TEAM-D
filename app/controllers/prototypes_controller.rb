class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :destroy ]

  def index
    @prototypes = Prototype.includes(:user)
  end
  
  def new
    @prototype = Prototype.new
  end

  def edit
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

end
