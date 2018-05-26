class ReviewsController < ApplicationController
before_action :logged_in?, 
    def create
        review = Review.new(review_params)
        review.user_id = current_user.id
        review.product_id = params[:product_id]
        review.save
        redirect_to :back

    end
        
    def review_params
        params.require(:review).permit(:description, :rating)
    end
private
    def logged_in?
        if !current_user
            redirect_to signup_path
        end
    end
end
