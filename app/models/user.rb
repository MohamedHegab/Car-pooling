class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	############ validations ############
  validates_presence_of :full_name, :phone_number
  validates_length_of :full_name, :minimum => 6
  validates_uniqueness_of :phone_number, :email

	############ Assocciations ############
	has_many :trips, class_name: 'Trip', foreign_key: :driver_id

end
