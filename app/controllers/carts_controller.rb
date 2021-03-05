class CartsController < ApplicationController
  def index
  end

  def create
    adder_id = params[:adder_id].to_i
    item_id = params[:item_id].to_i
    who = params[:who]
    quantity = params[:quantity]
    category_id = params[:category_id]
    Cart.create!(adder_id: adder_id, who: who, item_id: item_id, quantity: quantity)
    if (who.eql?("user"))
      redirect_to "/usermenus/#{category_id}"
    else
      redirect_to "/clerkmenus/#{category_id}"
    end
  end

  def show
    who_id = params[:id].split(" ")
    who = who_id[0]
    id = who_id[1]
    @order_lists = Cart.where(who: who, adder_id: id)
    # debugger
  end

  def destroy
    str = params[:id].split(" ")
    who = str[0]
    adder_id = str[1]
    id = str[2]
    Cart.find(id).destroy

    if str.length() == 4
      if str[3].eql?("c")
        redirect_to "/clerkmenus/#{adder_id}"
      else
        redirect_to "/usermenus/#{adder_id}"
      end
      return
    end

    redirect_to "/carts/#{who} #{adder_id}"
  end
end
