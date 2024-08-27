class ReviewsController < ApplicationController


  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    respond_to do |format|
      if @review.save
        format.html { redirect_to list_path(@list) }
        format.json
      else
        @bookmark = Bookmark.new
        format.html { render "lists/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
