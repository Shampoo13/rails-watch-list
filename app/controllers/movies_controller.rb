class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie =Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to_movie_path(@movie)
   else
      render :new
   end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params_require(:movie).permit(:title, :poster_url, :overview, :rating, :trailer)
  end
end
