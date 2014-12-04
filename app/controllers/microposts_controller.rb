class MicropostsController < ApplicationController
   before_filter :signed_in_user, only: [:create , :destroy]
   before_filter :correct_user, only: :destroy


  def index
  end

  def create
  	@micropost = current_user.microposts.build(user_params)
  	if @micropost.save
  		flash[:success] = "Micropost Created!"
  		redirect_to "/"
  	else
      @feed_items = []
  		render 'pages/home'
  	end
  end

  def destroy
    @micropost.destroy
    redirect_to '/'
  end
 # require must contail the controller name
  def user_params
    params.require(:micropost).permit(:content)
  end


  private

  def correct_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to '/' if @micropost.nil?
  end



end
