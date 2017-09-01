class Users::Manager < User
	has_many :lead_generators, class_name: 'Users::LeadGenerator', foreign_key: 'parent_id'
end