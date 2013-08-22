class PlacesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
    end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      flash[:success] = "Place created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @place.destroy
    redirect_to root_url
  end

  private

    def place_params
      params.require(:place).permit(:description, :title)
    end
  
    def correct_user
      @place = current_user.places.find_by(id: params[:id])
      redirect_to root_url if @place.nil?
    end
end


def show
  @place = Place.find(params[:id])
  @user = @place.users.paginate(:page => params[:page])
 end

