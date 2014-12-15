class Five9Providers::ReportProvider < Five9Providers::BaseProvider

  def run_report(report_name)
    response = five9_soap_client.call :run_report,
                                      message: {
        :folderName => 'API',
        :reportName => report_name,
        :criteria => {
            :time => {
                :start => '2014-01-01T00:00:00.000-07:00',
                :startSpecified => true,
                :endSpecified => false
            }
        }
    }

  report_id = response.body[:run_report_response][:return]
  end

  def is_report_running?(report_id)
    response = five9_soap_client.call :is_report_running,
                                      message: {
                                          :identifier => report_id,
                                          :timeout => 0
                                      }

    status = response.body[:is_report_running_response][:return]
  end

  def get_report(report_id)
    response = five9_soap_client.call :get_report_result,
                                      message: {
                                          :identifier => report_id
                                      }

    header_array = response.body[:get_report_result_response][:return][:header][:values][:data]
    records_array = response.body[:get_report_result_response][:return][:records]
  end
end
