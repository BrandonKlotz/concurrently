class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         authentication_keys: [:login]

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, :multiline => true
  before_save :validate_username

  attr_writer :login

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end
end
