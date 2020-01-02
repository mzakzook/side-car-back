class Provider < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :delete_all
  has_many :menu_items, dependent: :delete_all
  has_many_attached :images
  
  def self.by_user_id(id)
    providers = Provider.select{|p| p.user.id == id.to_i}
  end
end
