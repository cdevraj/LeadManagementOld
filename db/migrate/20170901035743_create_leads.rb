class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :email2
      t.string :phone_number
      t.string :phone_number2
      t.string :category
      t.string :company_url
      t.text :about_me
      t.string :status
      t.text :comment
      t.integer :lead_id

      t.timestamps
    end
  end
end
