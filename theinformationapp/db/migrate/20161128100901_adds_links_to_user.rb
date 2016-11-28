class AddsLinksToUser < ActiveRecord::Migration
  def change
  	add_column :users, :good_link, :string
  	add_column :users, :wrong_email_link, :string
  	add_column :users, :wrong_nonce_link, :string
  end
end
