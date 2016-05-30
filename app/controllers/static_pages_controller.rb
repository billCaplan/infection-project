class StaticPagesController < ApplicationController

 @@infect_amount = 0
  def root
    @courses = Course.all
    @users = User.all
    @infect_amount = @@infect_amount

  end

  def change_amount
  
    @@infect_amount = params[:limited_infection][:val].to_i
    redirect_to root_url
  end
end
