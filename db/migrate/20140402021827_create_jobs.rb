class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_type
      t.integer :workers
      t.integer :county_id
      t.datetime :end_time

      t.timestamps
    end
  end
end
