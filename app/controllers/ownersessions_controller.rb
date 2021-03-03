class OwnersessionsController < OwnerloginController
  skip_before_action :ensure_owner_logged_in

  def new
  end

  def create
    owner = Owner.find_by(email: params[:email])

    if owner && owner.authenticate(params[:password])
      session[:current_owner_id] = owner.id
      redirect_to "/owners"
    else
      flash[:error] = "your login attempt was invalid, please try again"
      redirect_to "/owners"
    end
  end

  def destroy
    session[:current_owner_id] = nil
    @current_owner = nil
    redirect_to "/owners"
  end
end
