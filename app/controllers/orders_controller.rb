class OrdersController < ApplicationController
  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
     if @user_order.valid?
       @user_order.save
       redirect_to action: :index
     else
       render action: :new
     end
  end

  private
 def order_params
  params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id, :user_id, :item_id)
 end

end
