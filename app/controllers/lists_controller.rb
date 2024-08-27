class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  def create
    @list = List.new(list_params)
    @lists = List.all
    if @list.save
      redirect_to lists_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end


  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
