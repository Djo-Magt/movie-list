class BookmarksController < ApplicationController

  before_action :set_movies, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end


  def new
  end

  def create

  end


  def destroy
    @movie.destroy
    redirect_to list_path, status: :see_other
  end


  private


  def set_movies
    @movie = Movie.find(params[:id])
  end

end
