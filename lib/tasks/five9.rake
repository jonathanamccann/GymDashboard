namespace :five9 do

  desc "Get Report"
  task :get_report => :environment do
    provider = Five9Providers::ReportProvider.new
    report_id = provider.run_report('api_iron_tribe_lifetime')
    report_running = provider.is_report_running?(report_id)
    until report_running == false
      puts "Waiting for report ##{report_id} to finish running."
      sleep 10
      report_running = provider.is_report_running?(report_id)
    end

    records = provider.get_report(report_id)

    puts records.inspect

    records.each do |call_data|
      call = call_data[:values][:data]
      puts call.inspect
      new_call = Call.create(
          call_id: call[0],
          timestamp: call[1],
          campaign: call[2],
          agent: call[3],
          disposition: call[4],
          ani: call[5],
          dnis: call[6],
          call_time: call[7],
          talk_time: call[8],
          hold_time: call[9],
          transfers: call[10],
          recording: call[11],
          call_type: call[12],
          first_name: call[13],
          last_name: call[14],
          phone_number: call[15],
          ivr_time: call[16],
          queue_wait_time: call[17],
          client_id: call[18],
          branch_id: call[19]
      )
      puts "Created new Call"
      puts new_call.inspect
    end

  end


end

