class UsersController < ApplicationController
  before_filter :signed_in_user , only: [:update , :edit]
  before_filter :correct_user , only: [:update , :edit]

	def show
		@user = User.find(params[:id])

	end


  def new
  	@user = User.new
  end
  

  def create
  	@user = User.new(user_params)
   # render :plain => params[:user].inspect
  	if @user.save
  		sign_in @user
  		flash[":success"] = "Welcome To Ruby On Rails Application"
  		redirect_to @user

  	else
  		render 'new'
  	end

  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated!"
      sign_in @user
      redirect_to @user
      else
        render 'edit'
    end
  end


  def user_params
      params.require(:user).permit(:name, :email  , :password , :password_confirmation)
  end



  private
  def signed_in_user
   
    store_location
    redirect_to signin_path , notice: "Please Sign in."  unless signed_in?
  end

  def correct_user
    @user  = User.find(params[:id])
    redirect_to "/" unless current_user?(@user)
  end


end
