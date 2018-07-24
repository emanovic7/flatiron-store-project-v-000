class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def current_cart
    current_cart = Cart.find(params[:id])
  end


end
