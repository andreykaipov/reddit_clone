
# The password_digest attribute is necessary so we can use 
# the has_secure_password() method in our user.rb class.

class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
  end
end
