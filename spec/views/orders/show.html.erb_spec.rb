require 'rails_helper'

RSpec.describe 'orders/show', type: :view do
  let(:product) { Product.create(name: 'Accoutic Guitar', price: 86300) }
  let(:order) { Order.create(total_without_discounts: 90000, total_with_discounts: 81000) }

  before do
    assign(:order, order)
    # Aquí necesitamos asegurarnos de que se asignen correctamente los elementos de la orden
    assign(:order_items, [OrderItem.create(product: product, order: order, price: 86300, quantity: 2)])
    # Aquí es donde podría estar el problema. Verifica que se asigne correctamente.
    assign(:order_discounts, [OrderDiscount.create(description: '10% off for purchases over £800', amount: 9000, order: order)])
    render
  end

  it 'displays the order number' do
    expect(rendered).to have_content("Order Number: #{order.id}")
  end

  it 'displays the order items' do
    expect(rendered).to have_content(product.name)
    expect(rendered).to have_content('£863.0 x 2')
  end

  it 'displays the discounts applied' do
    # Cambia a una verificación más flexible con expresiones regulares
    expect(rendered).to match(/10% off for purchases over £800/)
  end

  it 'displays the total without discounts' do
    expect(rendered).to have_content('£900.0')
  end

  it 'displays the total with discounts' do
    expect(rendered).to have_content('£810.0')
  end
end
