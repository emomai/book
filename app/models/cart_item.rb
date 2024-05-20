class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def line_total
    product.price * quantity
  end
end
