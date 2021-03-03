class OwnerloginController < ApplicationController
  before_action :ensure_owner_logged_in

  def current_owner
    if @current_owner_id
      return @current_owner
    end

    current_owner_id = session[:current_owner_id]

    if current_owner_id
      @current_owner = Owner.find(current_owner_id)
    else
      nil
    end
  end

  def ensure_owner_logged_in
    unless current_owner
      return @current_owner
    end
  end
end
