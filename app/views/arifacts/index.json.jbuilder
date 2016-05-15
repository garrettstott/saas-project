json.array!(@arifacts) do |arifact|
  json.extract! arifact, :id, :name, :key, :project_id
  json.url arifact_url(arifact, format: :json)
end
