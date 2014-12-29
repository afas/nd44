class AddDescriptionToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :description, :text
  end
end
