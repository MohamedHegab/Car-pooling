class Place < ApplicationRecord
  validates_presence_of :name, :longitude, :latitude
  validates_uniqueness_of :name
  validates :longitude, uniqueness: { scope: :latitude }
end
