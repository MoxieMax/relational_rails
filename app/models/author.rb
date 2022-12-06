class Author < ApplicationRecord
  has_many :books
  
  def self.order_created
    order(created_at: :desc)
  end
end