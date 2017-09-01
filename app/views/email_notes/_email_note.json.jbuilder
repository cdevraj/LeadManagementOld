json.extract! email_note, :id, :email_id, :notes, :user_id, :created_at, :updated_at
json.url email_note_url(email_note, format: :json)
