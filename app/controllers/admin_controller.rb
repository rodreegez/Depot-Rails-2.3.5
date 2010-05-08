class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => "index")
      else
        flash.now[:notice] = "I'm sorry, I don't think I know you"
      end
    end
  end

  def logout
  end

  def index
  end

end
