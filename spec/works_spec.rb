require 'spec_helper'

require 'rails_helper'

RSpec.describe DiscountService, type: :service do
  let(:product_guitar) { Product.create(name: 'Accoutic Guitar', price: 86300) }
  let(:product_other) { Product.create(name: 'Piano', price: 50000) }
  let(:cart) { Cart.new({ products: [] }) }

  before do
    cart.add(product_guitar)
    cart.add(product_guitar)
    cart.add(product_other)
    cart.add(product_other)
    cart.add(product_other)
    cart.add(product_other)
  end

  describe '#calculate_discounts' do
    it 'applies 10% discount for purchases over £800' do
      discount_service = DiscountService.new(cart)
      result = discount_service.calculate_discounts
      expect(result[:total_discount]).to be > 0
      expect(result[:discount_details]).to include(include(description: '10% off for purchases over £800'))
    end

    it 'applies guitar discount when buying 2 or more' do
      discount_service = DiscountService.new(cart)
      result = discount_service.calculate_discounts
      expect(result[:discount_details]).to include(include(description: 'Price of each guitar drop to $655 for 2 or more Guitars'))
    end

    it 'applies 5% discount for buying 4 or more items of the same type' do
      discount_service = DiscountService.new(cart)
      result = discount_service.calculate_discounts
      expect(result[:discount_details]).to include(include(description: '5% off for buying 4 or more Piano'))
    end
  end
end


RSpec.describe OrdersController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:product_guitar) { Product.create(name: 'Accoutic Guitar', price: 86300) }
  let(:product_other) { Product.create(name: 'Piano', price: 50000) }

  # Inicializar el almacenamiento del carrito con productos en el formato esperado
  let(:session_data) { { products: [product_guitar.id, product_guitar.id, product_other.id, product_other.id, product_other.id, product_other.id] } }
  let(:cart) { Cart.new(session_data) }

  before do
    sign_in user
    # Configura el carrito en el controlador utilizando los datos de la sesión
    allow(controller).to receive(:set_cart).and_return(cart)
    controller.instance_variable_set(:@cart, cart)  # Establecer directamente la variable de instancia @cart
  end

  describe 'POST #create' do
    it 'creates a new order with the correct totals and discounts' do
      post :create
    
      order = Order.last
      
      # Comprueba los valores antes de que el carrito sea borrado
      expect(order.total_without_discounts).to eq(372600) # Total esperado antes de aplicar los descuentos
      expect(order.total_with_discounts).to be < order.total_without_discounts
      expect(order.order_items.count).to eq(2) # 2 tipos de productos: guitarra y piano
      expect(order.order_items.first.quantity).to eq(2) # Cantidad de guitarras
      expect(order.order_items.second.quantity).to eq(4) # Cantidad de pianos
      expect(order.order_discounts.count).to be > 0
      
      # Verifica que el carrito esté vacío después de crear la orden
      expect(cart.items).to be_empty
    end

    it 'redirects to the order show page with a success message' do
      post :create
      expect(response).to redirect_to(order_path(Order.last))
      expect(flash[:notice]).to eq('Your order has been placed successfully!')
    end
  end
end