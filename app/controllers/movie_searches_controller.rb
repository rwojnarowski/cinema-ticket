class MovieSearchesController < ApplicationController
  def new
    @search = MovieSearch.new
  end

  def create
    #render plain: params[:movie_search].inspect

    @search = MovieSearch.create(search_params)
    redirect_to @search
  end

  def show
    @search = MovieSearch.find(params[:id])
  end


private
  def search_params
    params.require(:movie_search).permit(:keywords, :genre_id)
  end

end
