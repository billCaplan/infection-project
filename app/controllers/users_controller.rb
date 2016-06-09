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


  def update
  
    @user = User.find(params[:user][:id])
    list_to_alter = @user.total_infection

    list_to_alter[2].each do |student_to_alter|
      @user = User.find(student_to_alter.id)
      @user.update({:version => params[:user][:version]})
    end
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
