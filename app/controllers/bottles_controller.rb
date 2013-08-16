class BottlesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @bottle = current_user.bottles.build(bottle_params)
    if @bottle.save
      flash[:success] = "Bottle created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @bottle.destroy
    redirect_to root_url
  end

  private

    def bottle_params
      params.require(:bottle).permit(:content)
    end
  
    def correct_user
      @bottle = current_user.bottles.find_by(id: params[:id])
      redirect_to root_url if @bottle.nil?
    end
end
