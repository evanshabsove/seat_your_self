class LogInController < ApplicationController
  def new
  end

  def create
     user = User.find_by(user_name: params[:user_name])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to root_path, notice: "Logged In!"
     else
       flash.now[:alert] = "Invalid User Name or Password"
       render "index"
     end
   end

 def destroy
   session[:user_id] = nil
   redirect_to root_url, notice: "Logged Out!"
 end
end
