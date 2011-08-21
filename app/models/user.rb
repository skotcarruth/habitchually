class User < ActiveRecord::Base
  
   has_many :habits
   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
 
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    img = access_token['user_info']['image']
    p data
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create!(:first_name => data['first_name'], :last_name => data['last_name'], :email => data["email"], :password => Devise.friendly_token[0,20], :avatar => open(img)) 
    end
  end
  
end
