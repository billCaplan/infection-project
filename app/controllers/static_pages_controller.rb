class StaticPagesController < ApplicationController
  def root
    @courses = Course.all
    @users = User.all
  end
end
