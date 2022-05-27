class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def edit
  end

  def show
    @movies = Movie.all.select { |m| @list.movies.include? m }
  end

  def update
    @list.update(list_params)
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def reviews
    @review = @list.reviews
  end

  private

  def list_params
    params.require(:list).permit(:name, :id)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
