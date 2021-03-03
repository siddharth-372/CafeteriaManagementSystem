class ClerksController < ClerkloginController
  skip_before_action :ensure_clerk_logged_in

  def index
    if current_clerk
      render "clerkpage"
    else
      render "index"
    end
  end

  def new
  end

  def create
    Clerk.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )

    redirect_to "/owners"
  end
end
