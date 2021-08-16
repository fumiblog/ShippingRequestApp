# json.array!(@shipments) do |shipment|
#   json.extract! shipment, :construction.name
#   json.start shipment, ship_date
# end

json.array! @heads do |head|
  json.id head.id
  json.title "(" + head.user.name + ")" + head.delivery + " 納品"
  json.start head.ship_date
end

# json.array! @heads, :id, :delivery, :ship_date

# json.text "ほげほげ"