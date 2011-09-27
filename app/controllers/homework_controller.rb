class HomeworkController < ApplicationController
  private
  before_filter :authenticate_account!

  # For every action that needs to load a specific Homework, make this a before_filter
  before_filter :find_id, :only => %w(show edit update destroy)

  def find_id
    # Only access homework from your own account
    @homework = current_account.homework.find(params[:id])
    return true if @homework

    # Process the error
    flash.alert = "Homework #{params[:id]} not found"
    redirect_to root_url, :status => :not_found
    return false
  end

  public
  def show
    
  end
  
  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.new params[:homework].merge(:owner => current_account)
    if @homework.save
      # Success...
      flash.notice = "Homework '#{@homework.name}' created"
      redirect_to root_path
    else
      # Failure..
      flash.alert = "Failed: #{@homework.errors.full_messages.join(', ')}"
      render :action => "new"
    end
  end

  def edit
  end
  
  def update
    if @homework.update_attributes(params[:homework])
      # success
      flash.notice = "Homework '#{@homework.name}' updated"
       redirect_to root_path
    else
      # Failure
      flash.alert = "Failed: #{@homework.errors.full_messages.join(', ')}"
      render :action => "edit"
    end
  end

  def destroy
    @homework.destroy
    redirect_to root_url
  end
end
