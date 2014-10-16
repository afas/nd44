class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :author
      t.string :email
      t.string :address
      t.integer :rtype
      t.text :body
      t.integer :rstatus

      t.timestamps
    end
  end
end
