class AddTables < ActiveRecord::Migration
  def change
    eval(UserHelper.create_table);
    add_column :users, :karma, :integer

    create_table :comments do |x|
      x.belongs_to :user, index: true
      x.belongs_to :post, index: true
      x.text :text
      x.integer :votes, index: true
      x.timestamps
    end

    create_table :posts do |y|
      y.belongs_to :user
      y.string :url, index: true
      y.string :title, index: true
      y.integer :votes, index: true
      y.timestamps
    end
  end
end
