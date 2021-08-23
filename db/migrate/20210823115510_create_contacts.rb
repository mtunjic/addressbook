class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :user, null: false, foreign_key: true
      t.string :company
      t.string :job_title
      t.date :birthdate
      t.string :chat
      t.string :website
      t.text :notes
      t.integer :group_id

      t.timestamps
    end
  end
end
