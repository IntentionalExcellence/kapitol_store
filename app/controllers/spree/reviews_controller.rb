module Spree
  class ReviewsController < Spree::StoreController
    def index

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

    private

    def review_params
      params.require(:review).permit(:description, :name, :email, :city, :state)
    end

  end
end