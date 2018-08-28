class Trip < ApplicationRecord
	############ validations ############
	validates_numericality_of :number_of_seats, only_integer: true, greater_than_or_equal_to: 3
	validates :departure_time, in_future: true

	############ Assocciations ############
	belongs_to :driver, class_name: 'User'
	belongs_to :source, class_name: 'Place'
	belongs_to :destination, class_name: 'Place', foreign_key: :destination_id
end
