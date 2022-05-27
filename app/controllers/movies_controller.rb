class MoviesController < ApplicationController
  def create
    @movie = Movie.new(movie_params)
    # we need `list_id` to associate movie with corresponding list
    @list = List.find(params[:list_id])
    @movie.list = @list
    if @movie.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def new
    @list = List.find(params[:list_id])
    @movie = Movie.new
  end

  def index
    raise
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating, :list_id)
  end
end
