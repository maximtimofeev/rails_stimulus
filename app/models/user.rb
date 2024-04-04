class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :validatable, :trackable

  validates :login, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }, format: { with: Constants::NAME_FORMAT_REGEX }
  validates :email, presence: true, uniqueness: true, format: { with: Constants::EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  def enforce_password_validation
    @enforce_password_validation = true
  end

  private

  def password_required?
    @enforce_password_validation || password.present?
  end

  def self.find_for_database_authentication(auth_hash)
    self.where("login = :query OR email = :query", query: auth_hash[:login].downcase).first
  end
end
