require "json"

class OrdersController < ApplicationController
  def index
  end

  def create
    buyer_id = params[:buyer_id].to_i
    who = params[:who]
    total_price = params[:total_price].to_i
    orderitems = params[:orderitems]
    Order.create!(
      buyer_id: buyer_id,
      who: who,
      total_price: total_price,
      orderitems: orderitems,
      status: false,
      data_ordered: Date.today,
    )

    if who.eql?("clerk")
      Cart.where(who: who, adder_id: buyer_id).delete_all
    end

    render "orders/thank"
  end

  def show
    who_id = params[:id].split(" ")
    @who = who_id[0]
    @buyer_id = who_id[1]
    order_lists = Cart.where(who: @who, adder_id: @buyer_id)
    list_hashes = []
    @total_price = 0
    order_lists.each do |item|
      new_hash = {
        :item_id => item.id,
        :quantity => item.quantity,
        :price => MenuItem.find(item.item_id).price,
      }
      list_hashes.push(new_hash)
      @total_price += MenuItem.find(item.item_id).price * item.quantity
    end
    @array_string = list_hashes.to_json
  end
end
