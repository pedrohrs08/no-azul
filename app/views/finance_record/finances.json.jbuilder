json.array!(@finances) do |finance|
  json.extract! finance, :id, :description, :expense, :processed, :date, :value
end