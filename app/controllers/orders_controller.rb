class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :index]

  def index
    @orders = Order.where(user: current_user)
  end

  def create
    discount_service = DiscountService.new(@cart)
    discount_data = discount_service.calculate_discounts

    @order = current_user.orders.new(
      total_without_discounts: @cart.total,
      total_with_discounts: @cart.total - discount_data[:total_discount]
    )
    # Create order items from cart
    @cart.items.each do |item|
      @order.order_items.build(
        product: item.product,
        quantity: item.count,
        price: item.product.price
      )
    end
    # Create discounts
    discount_data[:discount_details].each do |discount|
      @order.order_discounts.build(description: discount[:description], amount: discount[:amount])
    end

    if @order.save
      @cart.clear # Vacía el carrito después de crear la orden
      redirect_to @order, notice: 'Your order has been placed successfully!'
    else
      raise
      redirect_to cart_path, alert: 'There was an error processing your order.', status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end
  
end