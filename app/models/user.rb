class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  mount_uploader :avatar

  def self.build_account_name(email)
    account_name = []
    email.each_char { |char|
      if char != "@"
        account_name.push(char)
      else
        return account_name.join
      end
    }
  end
end
