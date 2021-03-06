class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :evaluations, dependent: :destroy

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
