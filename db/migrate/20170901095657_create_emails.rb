class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.string :subject
      t.text :content
      t.string :smtp

      t.timestamps
    end
  end
end
