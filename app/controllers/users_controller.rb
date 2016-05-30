class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to root_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
