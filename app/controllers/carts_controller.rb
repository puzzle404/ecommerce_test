class CartsController < ApplicationController
  def show
    discount_service = DiscountService.new(@cart)
    @total_discounts = discount_service.calculate_discounts[:total_discount]
    @discount_details = discount_service.calculate_discounts[:discount_details]
  end

  def update
    product = Product.find(params[:product_id])
    @cart.add product
    redirect_to root_path, notice: "#{product.name} added to cart!"
  end

  def destroy
    @cart.delete(params[:product_id])
    redirect_to cart_path, notice: "Item removed!"
  end
end
