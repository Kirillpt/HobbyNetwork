class PostRemoveCategoryField < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.remove :category
    end
  end
end
