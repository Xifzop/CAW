require 'active_record'

#search for table named users in mysql
class User < ActiveRecord::Base
=begin
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, :presence => true, :length => {:minimum => 6, :maximum => 50}
    validates :age, :presence => true
=end
    #validates :email, :presence => true, format => {:with => VALID_EMAIL_REGEX}, :uniqueness => true/{case_sensitive => false
    # }
    # before_save {do...
    # } validates :password, length: { minimum: 6 }
    #  has_secure_password
    #  validates :password, length: { minimum: 6 }
    #  user.authenticate("foobar")
end