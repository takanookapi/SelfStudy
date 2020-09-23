class CreateLevelups < ActiveRecord::Migration[6.0]
  def change
    create_table :levelups do |t|
      t.integer    :level_up,          default: 1
      t.integer    :thresold
      t.timestamps
    end
  end
end
