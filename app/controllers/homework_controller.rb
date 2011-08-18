class HomeworkController < ApplicationController
  before_filter :authenticate_account!

  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.create params[:homework].merge(:owner => current_account)
    if @homework.valid?
      # Success...
      flash.notice = "Homework '#{@homework.name}' created"
      redirect_to root_path
    else
      # Failure..
      flash.alert = "Failed: #{@homework.errors.full_messages.join(', ')}"
      render :action => "new"
    end
  end
end
