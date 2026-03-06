class Api::V1::OrdersController < ActionController::API
  before_action :set_user

  def index 
    @orders = @user.orders.includes(order_items: :products)

    render json: @orders, include: {
      order_item: {
        only: [],
        include: {
          product: { only: [:name] }
        }
      }
    }
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end