class User < ActiveRecord::Base

  has_secure_password
  before_validation :strip_whitespace
  validates :password, presence: true, length: {minimum: 3}
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, 
                    :uniqueness => {:case_sensitive => false}


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else 
      nil
    end
  end

  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
    end

  end
