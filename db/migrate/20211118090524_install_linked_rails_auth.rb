# frozen_string_literal: true

class InstallLinkedRailsAuth < ActiveRecord::Migration[6.1]
  def up
    create_table :otp_secrets do |t|
      t.timestamps
      t.integer :owner_id, null: false
      t.string :otp_secret_key, null: false
      t.boolean :active, default: false
      t.index :owner_id, unique: true
    end
  end

  def down
    Doorkeeper::AccessToken.delete_all
    Doorkeeper::Application.delete_all

    drop_table :otp_secrets
  end
end
