class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :carts
  has_many :orders
  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'user_id'

  def create_current_cart
    new_cart = carts.create
    self.current_cart_id = new_cart.id
    save
  end

  def remove_cart
    self.current_cart_id = nil
    save
  end



end
