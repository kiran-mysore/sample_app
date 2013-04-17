class UsersController < ApplicationController
  


  def show
  	#raise params.inspect
  	@user = User.find(params[:id])
  end

  def new
     @user = User.new
  end

  def create
   	 @user = User.new(params[:user])
   	 if @user.save
   	 	#redirect_to user_path(@user) it can also be done as follows     
   	 	sign_in @user
      flash[:success] = "Welcome to CreatorsMap"
   	 	redirect_to @user

   	 else
   	 	render 'new'
   	 end
  end 

end

