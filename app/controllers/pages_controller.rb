class PagesController < ApplicationController
  def home
    if user_signed_in?
       redirect_to articles_path
    end
  end

  def about
  end
end
