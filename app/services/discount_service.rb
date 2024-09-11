class DiscountService
  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def calculate_discounts
    total_discount = 0
    discount_details = []

    # Aplicar descuentos combinables en el orden correcto
    total_discount += apply_guitar_discount(discount_details) # Primero aplica el descuento de guitarra
    total_discount += apply_bulk_item_discount(discount_details) # Luego aplica el descuento del 5%

    # Recalcular el total del carrito después de aplicar los primeros descuentos
    total_after_discounts = cart.total - total_discount

    # Finalmente, aplica el descuento del 10% si el total es mayor a £800
    total_discount += apply_total_purchase_discount(discount_details, total_after_discounts)

    { total_discount: total_discount, discount_details: discount_details }
  end

  private

  def apply_total_purchase_discount(discount_details, total_after_discounts)
    return 0 unless total_after_discounts > 80000

    discount = total_after_discounts * 0.10
    discount_details << { description: "10% off for purchases over £800", amount: discount }
    discount
  end

  def apply_guitar_discount(discount_details)
    guitar_item = cart.items.find { |item| item.product.name == 'Accoutic Guitar' && item.count >= 2 }
    return 0 unless guitar_item

    # Precio reducido de $655 por guitarra
    discount_per_guitar = (guitar_item.product.price - 65500)
    discount = guitar_item.count * discount_per_guitar
    discount_details << { description: "Price drop to $655 for 2 or more Guitars", amount: discount }
    discount
  end

  def apply_bulk_item_discount(discount_details)
    discount = 0

    cart.items.each do |item|
      # Aplica el descuento del 5% si hay 4 o más productos del mismo tipo
      if item.count >= 4
        # Verifica si es una guitarra con precio reducido, si no, usa el precio normal
        item_price = (item.product.name == 'Accoutic Guitar' && item.count >= 2) ? 65500 : item.product.price

        item_discount = (item_price * 0.05) * item.count
        discount += item_discount
        discount_details << { description: "5% off for buying 4 or more #{item.product.name}", amount: item_discount }
      end
    end

    discount
  end
end
