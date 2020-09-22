class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, length: { in: 6..20 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email, password_digest: password)
    if user 
      puts "user item is: #{user}" 
      return user
    else 
      return nil
    end
  end
end
