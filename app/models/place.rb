class Place < ApplicationRecord
	############ validations ############
  validates_presence_of :name, :longitude, :latitude
  validates_uniqueness_of :name
  validates :longitude, uniqueness: { scope: :latitude }

	############ Assocciations ############
  has_many :trips, inverse_of: :source, foreign_key: :source_id
  has_many :trips, inverse_of: :destination, foreign_key: :destination_id
end
