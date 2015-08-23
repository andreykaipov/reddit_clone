class User < ActiveRecord::Base
  # before saving, change the user's email to all downcase to standardize DB.
  before_save { self.email = self.email.downcase unless self.email.nil?}

  # A username must not be blank, must be between 4 and 30 characters,
  # must only consist of alphanumeric, underscore, and dash characters,
  # and has to be unique with no respect to case.
  VALID_USERNAME_REGEX = /\A[\w\-]+\z/
  validates(:username, { :presence   => true,
                         :length     => {minimum: 4, maximum: 30},
                         :format     => {with: VALID_USERNAME_REGEX},
                         :uniqueness => {case_sensitive: false}   })

  # A user's email is optional, but if it is filled in, it must follow
  # the valid email regex guidelines below, and must be below 255 characters.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, { :allow_blank => true, 
                      :format => {with: VALID_EMAIL_REGEX},
                      :length => {maximum: 255}             })

  # A user's password must be at least 6 characters.
  validates(:password, { :length => {minimum: 6} })

  # The following method encrypts the user's password in the database using
  # the BCrypt gem. This method adds the virtual attributes password and
  # password_confirmation. The following validations are also added:
  # password presence, password max length must be <= 72, confirmation
  # of password.
  has_secure_password
end