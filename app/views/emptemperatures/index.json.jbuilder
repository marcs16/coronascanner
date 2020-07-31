json.set! :data do
  json.array! @emptemperatures do |emptemperature|
    json.partial! 'emptemperatures/emptemperature', emptemperature: emptemperature
    json.url  "
              #{link_to 'Show', emptemperature }
              #{link_to 'Edit', edit_emptemperature_path(emptemperature)}
              #{link_to 'Destroy', emptemperature, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end