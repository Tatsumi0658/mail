json.extract! contact, :id, :name, :content, :created_at, :updated_at
json.url contact_url(contact, format: :json)
