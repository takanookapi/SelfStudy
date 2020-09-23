class CreateTimeReports < ActiveRecord::Migration[6.0]
  def change
    create_table :time_reports do |t|
      t.integer    :user_id,             null:false, foreign_key: true
      t.float      :study_time,          null:false
      t.datetime   :study_date,          null:false
      t.text       :memo,                null:false
      t.integer    :exp
      t.timestamps
    end
  end
end
