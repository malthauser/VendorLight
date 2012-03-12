# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  first_name             :string(255)
#  last_name              :string(255)
#  company_name           :string(255)
#

class User < ActiveRecord::Base
  include ActiveSupport

  has_many :products, dependent: :destroy
  has_many :vendor_relationships, dependent: :destroy
  has_many :vendors, through: :vendor_relationships, foreign_key: :vendor_id
  has_many :client_relationships, class_name: 'VendorRelationship', foreign_key: :vendor_id
  has_many :clients, through: :client_relationships, foreign_key: :user_id

  validates :email, presence: true
  #validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :products
  accepts_nested_attributes_for :vendor_relationships
  accepts_nested_attributes_for :client_relationships

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_reset_token, :set_password

  def full_name
    "#{first_name} #{last_name}".strip 
  end

  def name_or_email
    full_name.blank? ? email : full_name
  end

  private
  def set_reset_token
    unless self.reset_password_token.present?
      self.reset_password_token = User.reset_password_token 
      self.reset_password_sent_at = Time.now
    end
  end

  def set_password
    unless self.encrypted_password.present? || self.password.present?
      pass = SecureRandom.hex(8)
      self.attributes = { password: pass, password_confirmation: pass }
    end
  end

end
