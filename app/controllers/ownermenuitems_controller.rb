class OwnermenuitemsController < ApplicationController
  def index
  end

  def show
    @category_id = params[:id]
    @current_category = MenuCategory.find(@category_id)
    @item_lists = MenuItem.where(menu_category_id: @category_id)
  end

  def create
    # debugger
    food_name = params[:name]
    food_description = params[:description]
    food_price = params[:price].to_f
    MenuItem.create(
      name: params[:name],
      description: params[:description],
      price: params[:price].to_f,
      menu_category_id: params[:menu_category_id].to_i,
    )
    redirect_to "/ownermenuitems/#{params[:menu_category_id]}"
  end

  def destroy
    ids = params[:id].split(" ")
    menu_category_id = ids[0].to_i
    item_id = ids[1].to_i
    debugger
    MenuItem.find(item_id).destroy
    redirect_to "/ownermenuitems/#{menu_category_id}"
  end
end
