class KlassesController < ApplicationController
  private
  before_filter :authenticate_account!

  # For every action that needs to load a specific Homework, make this a before_filter
  before_filter :find_id, :only => %w(show edit update destroy)
  def find_id
    # Only access homework from your own account
    @klass = Klass.find(params[:id])
    return true if @klass

    # Process the error
    flash.alert = "Class #{params[:id]} not found"
    redirect_to root_url, :status => :not_found
    return false
  end

  public

  def show
  end

  def index
  end

  def new
    @klass = Klass.new
  end

  def create
    @klass = Klass.new(params[:class])
    if @klass.save
      flash.notice = "Class #{@klass.name} created."
      redirect_to class_url(@klass)
    else
      flash.alert = "Failed: #{@klass.errors.full_messages.join(', ')}"
      render :action => "new"
    end
  end

  def edit
  end

  def update
  end

end
