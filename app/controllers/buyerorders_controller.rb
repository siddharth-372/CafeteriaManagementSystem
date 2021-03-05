class BuyerordersController < ApplicationController
  def show
    buyer_id = params[:id].split(' ')

    @order_lists = Order.where(buyer_id: buyer_id[1].to_i, who: buyer_id[0])
  end
end
