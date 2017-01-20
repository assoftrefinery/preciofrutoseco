json.extract! listacorreo, :id, :nombre, :email, :created_at, :updated_at
json.url listacorreo_url(listacorreo, format: :json)