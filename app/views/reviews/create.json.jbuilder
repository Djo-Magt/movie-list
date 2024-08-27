if @review.persisted?
  json.form render(partial: "lists/review_form", formats: :html, locals: {list: @list, review: Review.new})
  json.inserted_item render(partial: "lists/review_show", formats: :html, locals: {review: @review})
else
  json.form render(partial: "lists/review_form", formats: :html, locals: {list: @list, review: Review.new})
end
