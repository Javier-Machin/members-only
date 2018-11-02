class User < ApplicationRecord
  before_create :generate_token
  has_secure_password
  has_many :posts

  def generate_token
    token = SecureRandom.urlsafe_base64
    self.remember_token = Digest::SHA1.hexdigest(token.to_s)
  end

end
