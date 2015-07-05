require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  
attr_reader :password

  property :id, Serial
  property :email, String, unique: true, message: 'That e-mail address is already registered!'
  property :username, String, unique: true, message: 'That username is already taken!'
  property :name, String
  property :password_digest, Text

  def password=(password)
  	@password=password
  	self.password_digest = BCrypt::Password.create(password)
  end
  
end

  