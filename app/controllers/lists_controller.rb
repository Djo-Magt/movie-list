class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
    @list = List.new
  end

  def show
  end

  def new
  end

  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path }
        format.json
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json
      end
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
