class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ############ Callbacks ############
  before_save :correct_full_name

	############ validations ############
  validates_presence_of :full_name, :phone_number
  validates_length_of :full_name, :minimum => 6
  validates_uniqueness_of :phone_number, :email

	############ Assocciations ############
  has_many :trips, class_name: 'Trip', foreign_key: :driver_id
	has_many :pickups, class_name: 'Trip', foreign_key: :passenger_id

  def correct_full_name
    if self.full_name_changed?
      self.full_name = self.full_name.gsub!(/\b\w/) { |str| str.downcase.capitalize! }
    end
  end
end
