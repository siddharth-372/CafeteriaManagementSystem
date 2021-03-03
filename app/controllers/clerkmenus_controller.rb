class ClerkmenusController < ApplicationController
  def index
  end

  def show
    category_id = params[:id]
    @item_lists = MenuItem.where(menu_category_id: category_id)
  end
end
