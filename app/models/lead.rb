class Lead < ApplicationRecord
	belongs_to :lead_generator, class_name: 'User', foreign_key: 'lead_id'
end
