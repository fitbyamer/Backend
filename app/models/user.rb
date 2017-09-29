class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader

  integerize :role, :guest, :user, :admin
  integerize :gender, :male, :female

  attr_accessor :login

  LOCALES=%w(ar en)

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, uniqueness: true
  validates :age, :height, :weight, numericality: true, unless: :admin?
  validates :aim, presence: true, unless: :admin?
  validates :phone_number, uniqueness: true, unless: :admin?

  has_many :api_tokens

  after_commit :generate_api_token, on: :create, unless: :admin?

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:email)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def generate_api_token
    api_tokens.create
  end

  def secure_random_token token=nil
    token ||= SecureRandom.urlsafe_base64(nil, false)
    "#{self.id}::#{token}::#{Time.now.to_i}"
  end

end
