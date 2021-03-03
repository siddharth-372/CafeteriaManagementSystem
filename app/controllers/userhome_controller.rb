class UserhomeController < UserloginController
  skip_before_action :ensure_user_logged_in

  def index
    # debugger
    if current_user
      render "userhome/userpage"
    else
      render "index"
    end
  end
end
