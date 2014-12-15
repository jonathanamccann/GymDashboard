class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :call_id
      t.datetime :timestamp
      t.text :campaign
      t.text :agent
      t.text :disposition
      t.string :ani
      t.string :dnis
      t.string :call_time
      t.string :talk_time
      t.string :hold_time
      t.string :transfers
      t.string :recording
      t.string :call_type
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :ivr_time
      t.string :queue_wait_time
      t.string :client_id
      t.string :branch_id

      t.timestamps
    end
  end
end
