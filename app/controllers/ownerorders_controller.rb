class OwnerordersController < OwnerloginController
  skip_before_action :ensure_owner_logged_in

  def index
    @clerklists = Order.where(who: "clerk", status: false)
    @customerlists = Order.where(who: "user", status: false)
  end

  def update
    order_id = params[:id]
    order = Order.find(order_id)
    order.status = true
    order.save
    redirect_to "/ownerorders"
  end
end
