class ClerksessionsController < ClerkloginController
  skip_before_action :ensure_clerk_logged_in

  def new
  end

  def create
    clerk = Clerk.find_by(email: params[:email])

    if clerk && clerk.authenticate(params[:password])
      session[:current_clerk_id] = clerk.id
      redirect_to "/clerks"
    else
      flash[:error] = "Your login attempt was invalid, Please try again"
      redirect_to "/clerks"
    end
  end

  def destroy
    session[:current_clerk_id] = nil
    @current_clerk = nil
    redirect_to "/clerks"
  end
end
