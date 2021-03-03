class OwnersController < OwnerloginController
  skip_before_action :ensure_owner_logged_in

  def index
    if current_owner
      render "ownerpage"
    else
      render "index"
    end
  end

  def new
  end

  def create
    Owner.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/owners"
  end
end
