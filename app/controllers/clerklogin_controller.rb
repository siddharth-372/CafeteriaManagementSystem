class ClerkloginController < ApplicationController
  before_action :ensure_clerk_logged_in

  def current_clerk
    if @current_clerk_id
      return @current_clerk
    end

    current_clerk_id = session[:current_clerk_id]

    if current_clerk_id
      @current_clerk = Clerk.find(current_clerk_id)
    else
      nil
    end
  end

  def ensure_clerk_logged_in
    unless @current_clerk_id
      redirect_to "/clerks"
    end
  end
end
