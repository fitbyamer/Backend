class ApiToken < ApplicationRecord


  validates :token, :user, presence: true
  validates :token, uniqueness: true

  belongs_to :user

  before_validation :generate_token

  private

  def generate_token
    self.token = loop do
      random_token = self.user.secure_random_token
      break random_token unless self.class.exists?(token: random_token)
    end unless token
  end
end
