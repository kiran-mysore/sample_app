class User < ActiveRecord::Base
  

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save{ 
       	|user|  user.email = user.email.downcase
     }


  before_save:create_remember_token # call this method 

  VALID_EMAIL_REGEX = /\A[\w\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false} 

  #validates :password, presence: true, length: { minimum: 6 }
    # above line was changed to the following
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private
      def create_remember_token
          self.remember_token = SecureRandom.urlsafe_base64 # SecureRandom.hex for ruby 1.8.7
      end  

end
