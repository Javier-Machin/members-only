class User < ApplicationRecord
  before_create :generate_token
  has_secure_password

  def generate_token
    token = SecureRandom.urlsafe_base64
    self.remember_token = Digest::SHA1.hexdigest(token)
  end

end
