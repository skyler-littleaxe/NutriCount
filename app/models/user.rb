class User < ApplicationRecord
  has_many :logs
  has_secure_password
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, confirmation: true
  validates :username, uniqueness: true
  validates :username, presence: true
  

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
        u.username = auth['info']['first_name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(16)
    end
  end
end
