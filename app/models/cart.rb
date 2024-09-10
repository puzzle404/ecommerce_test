class Cart
  class Item
    attr_reader :product, :count

    def initialize(product, count)
      @product = product
      @count = count
    end
  end

  def initialize(storage)
    @storage = storage
    @storage[:products] ||= []
  end

  def items
    @storage[:products].tally.map { |id, count| Item.new Product.find(id), count }
  end

  def clear
    @storage[:products] = []
  end

  def delete(id)
    index = @storage[:products].index(id.to_i)
    @storage[:products].delete_at index
  end

  def add(product)
    @storage[:products] << product.id
  end

  def size
    @storage[:products].size
  end

  def empty?
    size == 0
  end

  def total
    items.map { |item| item.product.price * item.count }.sum
  end

  private

  attr_reader :storage
end
