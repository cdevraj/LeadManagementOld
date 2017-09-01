class AddLeadGeneratorIdToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :lead_generator_id, :integer
    add_column :emails, :reciever_email, :string
    add_column :emails, :to_be_sent_in, :integer
  end
end
