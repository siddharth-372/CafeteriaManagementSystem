class OrderanalysisController < ApplicationController

  def index
    @order_lists = Order.all
    # debugger
  end

  def create
  end


end
