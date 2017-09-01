class Users::LeadGenerator < User
	belongs_to :manager, class_name: 'Users::Manager', foreign_key: 'parent_id'
end