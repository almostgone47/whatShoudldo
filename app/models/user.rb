class User < ApplicationRecord
  include Clearance::User

  mount_uploader :avatar, ImageUploader
  
  # has_many :authentications, dependent: :destroy
  has_many :events

  enum role: [:participant, :host, :superadmin]
 
end
