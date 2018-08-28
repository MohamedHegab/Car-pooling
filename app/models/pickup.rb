class Pickup < ApplicationRecord
	############ validations ############
	validates :departure_time, in_future: true

	############ Assocciations ############
	belongs_to :passenger, class_name: 'User'
	belongs_to :source, class_name: 'Place'
	belongs_to :destination, class_name: 'Place'
end
