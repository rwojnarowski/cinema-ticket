class GenresController < ApplicationController
  def index
    @genre = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_parameters)
    if @genre.save
      flash[:success] = "yay arr saved!"
      redirect_to genres_path
    else
      flash[:danger] = "sumting wong"
      render 'new'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:success] = "Genre removed"
    redirect_to genres_path
  end

  def show
    @genre = Genre.find(params[:id])
    @genremovies = @genre.movies
  end

  private

  def genre_parameters
    params.require(:genre).permit(:genre)
  end
end
