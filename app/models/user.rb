class User < ActiveRecord::Base
  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true, length: {minimum: 6}
  validates :first_name, presence:true
  validates :last_name, presence:true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
