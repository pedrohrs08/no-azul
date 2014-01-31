json.array!(@finances) do |finance|
  json.extract! finance, :id, :description
end