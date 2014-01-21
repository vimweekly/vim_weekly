class Admin < ActiveRecord::Base
  has_secure_password

  before_save :downcase_email

  VALID_REGEX = /\A[\w+@\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, format: { with: VALID_REGEX },
    uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }
  validates :password_digest, presence: true

  private
  def downcase_email
    self.email.downcase 
  end
end
