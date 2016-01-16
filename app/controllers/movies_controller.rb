class MoviesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @movie = Movie.paginate(:page => params[:page], :per_page => 10).order(:title)
  end

  def show
    @movie = Movie.find(params[:id])
    @moviegenres = @movie.genres
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

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:success] = "Edited!"
      redirect_to movies_path
    else
      flash[:danger] = "sumting wong"
      render 'edit'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title,:time,:description, genre_ids: [])
  end
end
