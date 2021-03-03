class OwnermenusController < ApplicationController
  def index
    @menu_category_list = MenuCategory.all
    render "index"
  end

  def create
    category_name = params[:name]
    MenuCategory.create!(name: category_name)
    redirect_to "/ownermenus"
  end

  def destroy
    category_id = params[:id].to_i
    lists = MenuItem.where(menu_category_id: category_id)
    # debugger
    lists.each do |item|
      MenuItem.find(item.id).destroy
    end
    MenuCategory.find(category_id).destroy

    redirect_to "/ownermenus"
  end
end
