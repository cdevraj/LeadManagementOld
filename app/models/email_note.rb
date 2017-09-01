class EmailNote < ApplicationRecord
  belongs_to :email
  belongs_to :user
end
