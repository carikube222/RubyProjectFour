class User < ApplicationRecord
  has_secure_password
  has_many :conditions, dependent: :destroy
  #for password update only
  # validates :password, :on => :create, length: {in: 7..20}, :presence => true
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, length: {minimum: 2}, presence: true
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :password, length: {in: 7..20}, :presence => true

  before_save do
      self.email.downcase!
      self.name.downcase!
  end
end
