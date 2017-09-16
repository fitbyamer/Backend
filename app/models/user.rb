class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, uniqueness: true

  ROLES=%w(guest user admin)

  ROLES.each_with_index do |role, index|
    define_method "#{role}?" do
      self.role == index
    end

    define_method "to_#{role}!" do
      self.role = index
    end

    define_singleton_method "#{role}_value" do
      index
    end

    scope "where_#{role}", ->{ where(role: index) }
  end

  def role_name
    ROLES[self.role]
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
