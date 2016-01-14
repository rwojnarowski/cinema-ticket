class MoviesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
  def index
    @movie = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      flash[:success] = "Movie added to database"
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:success] = "Movie removed from database"
    redirect_to movies_path
  end


  private

  def movie_params
    params.require(:movie).permit(:title,:time,:description)
  end
end
