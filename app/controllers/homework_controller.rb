class HomeworkController < ApplicationController
  before_filter :authenticate_account!

  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.create params[:homework].merge(:owner => current_account)
    redirect_to root_path
  end
end
