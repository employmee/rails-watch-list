class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def create
    @movie = Movie.new(movie_params)
    # we need `list_id` to associate movie with corresponding list
    #@list = List.find(params[:list_id])
    #@movie.list = @list
    if @movie.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movie = Movie.new
  end

  def show
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating, :list_id, :comment, :movie_id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
