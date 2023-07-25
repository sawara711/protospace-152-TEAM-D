class UsersController < ApplicationController
  def show
    @user = User.includes(:prototypes).find(params[:id])
  end
end
