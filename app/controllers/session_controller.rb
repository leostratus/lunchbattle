class SessionController < ApplicationController
  def create
    @user = User.find_by_token(params[:token])
    
    if @user
      session[:user_id] = @user.id
      redirect_to @user.fight
    else
      
    end
  end
end
