module Spree
  class ReviewsController < Spree::StoreController
    def index
      if current_spree_user && current_spree_user.admin?
        @reviews = Review.all.sort_by(&:created_at)
      else
        flash[:error] = "You cannot go there!"
        redirect_to root_path
      end
    end

    def create
      review = Review.new(review_params)
      if review.save
        flash[:notice] = "Thank you for reviewing our product!"
        redirect_to root_path
      else
        flash[:error] = "Something went wrong with recording your review."
        redirect_to root_path
      end
    end

    def destroy
      review = Review.find(params['id'])
      review.delete
      redirect_to reviews_path
    end

    def update_reviews
      review_arrays = params['review_data']
      review_arrays.each do |review_hash|
        review = Review.find(review_hash['id'])
        display_value = review_hash['display'].present?
        if review.display == display_value
          next
        else
          review.update_attribute(:display, display_value)
        end
      end
      redirect_to reviews_path
    end

    private

    def review_params
      params.require(:review).permit(:description, :name, :email, :city, :state)
    end

  end
end