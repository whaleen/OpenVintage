class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @bottle  = current_user.bottles.build
      @place  = current_user.places.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
