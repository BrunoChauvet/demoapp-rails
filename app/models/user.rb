class User < ActiveRecord::Base
  # Setup protected attributes for your model
  attr_protected :provider, :uid
  
  # Enable Maestrano for this user
  maestrano_user_via :provider, :uid, :tenant do |user,maestrano|
    user.first_name = maestrano.first_name
    user.last_name = maestrano.last_name
    user.email = maestrano.email
    user.country_code = maestrano.country
    #user.some_required_field = 'some-appropriate-default-value'
  end
  
  #===================================
  # Associations
  #===================================
  has_many :user_company_rels
  has_many :companies, through: :user_company_rels
  
  #===================================
  # Validation
  #===================================
  validate :first_name, presence: true
  validate :last_name, presence: true
  validate :email, presence: true
end
