json.extract! email, :id, :sender_id, :reciever_id, :subject, :content, :smtp, :created_at, :updated_at
json.url email_url(email, format: :json)
