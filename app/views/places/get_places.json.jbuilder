json.draw @draw
json.recordsTotal Place.count
json.recordsFiltered Place.count
json.data do
  json.array! @places do |place|
    json.id place.id
    json.name place.name
    json.longitude place.longitude
    json.latitude place.latitude
    json.actions edit_place_path(place)
  end
end