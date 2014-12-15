class Five9Providers::BaseProvider

  def initialize()
    @realm = Base64.strict_encode64("jmccann01@company.com:")
  end

  def five9_soap_client
    five9_soap_client = Savon.client(
        wsdl: "https://api.five9.com/wsadmin/AdminWebService?wsdl&user=jmccann01@company.com",
        namespace: "http://service.admin.ws.five9.com/",
        headers: {"Authorization" =>  "Basic #{@realm}"},
        env_namespace: :soapenv,
        namespace_identifier: :ser,
        ssl_verify_mode: :none,
        pretty_print_xml: true,
        logger: Rails.logger
    )
  end

  def log_response(response)
    Rails.logger.info response
  end

  def send_email_log(log)

    to_address = 'jmccann@company.com'

    smtp = {
        :address => 'legacy.company.com',
        :port => 25,
        :domain => 'company.com',
        :user_name => 'reports',
        :password => '',
        :authentication => :login,
        :enable_starttls_auto => true,
        :openssl_verify_mode => 'none' }
    Mail.defaults { delivery_method :smtp, smtp }
    mail = Mail.new do
      from 'reports@company.com'
      to  to_address
      subject 'API Log'
      body log
    end

    mail.deliver!
  end

  def send_public_email_log(log)

    to_addresses = ['jmccann@company.com','tlsmith@company.com','chightower@company.com','jjeter@company.com','blombard@company.com','ijones@company.com','klooney@company.com']

    to_addresses.each do |address|
      smtp = {
          :address => 'legacy.company.com',
          :port => 25,
          :domain => 'company.com',
          :user_name => 'reports',
          :password => '',
          :authentication => :login,
          :enable_starttls_auto => true,
          :openssl_verify_mode => 'none' }
      Mail.defaults { delivery_method :smtp, smtp }
      mail = Mail.new do
        from 'reports@company.com'
        to  address
        subject 'Five9 Summary Log'
        body log
      end

      mail.deliver!
    end
  end

end



