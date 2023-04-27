class User < ApplicationRecord
    has_secure_password # secure here to make sure there is a password and raise error messages
    validates :email, :uniqueness => true, :presence => true
    has_many :favorites
end
