class CreateEmailNotes < ActiveRecord::Migration[5.1]
  def change
  	connection.execute 'drop table if exists email_notes'
    create_table :email_notes do |t|
      t.references :email, foreign_key: true
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
