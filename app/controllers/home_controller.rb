class HomeController < ApplicationController
  def index
    if account_signed_in?
      @homework = current_account.homework
    end
  end

end
