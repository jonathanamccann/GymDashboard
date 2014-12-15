namespace :cyfe do

  desc "Get current lists and create new lists based on available contacts"
  task :one => :environment do

    post_body = '{
        "data":  [
        {
        "Date":  "20130320",
        "Users":  "32",
        "metric": "34"
    }
    ],
        "onduplicate":  {
        "Users":  "replace"
    },
        "color":  {
        "Users":  "#52ff7f"
    },
        "type":  {
        "Users":  "line"
    }
    }'

    request = Typhoeus::Request.new("https://app.cyfe.com/api/push/533652ad45e6b289001853458817",
                                :userpwd => "jonathanamccann@gmail.com:",
                                :method => :post,
                                :body => post_body,
                                :headers => { 'Content-Type' => "application/json"}
    )
    response = request.run.body
    JSON.parse(response)
    puts response
  end

  task :two => :environment do

    post_body = %Q{
    {
            "data":  [
              {
                "Dashboard_id": "Call Data",
                "Athlete": "#{Call.where(disposition: 'Athelete').count}",
                "Disconnected": "#{Call.where(disposition: 'Disconnected').count}",
                "Prospects": "#{Call.where("disposition = ? OR disposition = ?", 'Prospect', 'Thinking it Over').count}",
                "Total Calls": "#{Call.all.count}"
              }
            ],
              "onduplicate":  {
                "Live Calls":  "replace",
                "Voicemails":  "replace",
                "Disconnected":  "replace"
              }
    }
}

    puts post_body

    request = Typhoeus::Request.new("https://app.cyfe.com/api/push/5337354641d76542734935459120",
                                    :userpwd => "jonathanamccann@gmail.com:",
                                    :method => :post,
                                    :body => post_body,
                                    :headers => { 'Content-Type' => "application/json"}
    )
    response = request.run.body
    JSON.parse(response)
    puts response
  end

  task :three => :environment do

    calls = Call.all

    seven = 0
    eight = 0
    nine = 0
    ten = 0
    eleven = 0
    twelve = 0
    thirteen = 0
    fourteen = 0
    fifteen = 0
    sixteen = 0
    seventeen = 0
    eighteen = 0
    nineteen = 0

    calls.each do |call|
      hour = call.timestamp.hour
      if hour == 7
        seven += 1
      elsif hour == 8
        eight += 1
      elsif hour == 9
        nine += 1
      elsif hour == 10
        ten += 1
      elsif hour == 11
        eleven += 1
      elsif hour == 12
        twelve += 1
      elsif hour == 13
        thirteen += 1
      elsif hour == 14
        fourteen += 1
      elsif hour == 15
        fifteen += 1
      elsif hour == 16
        sixteen += 1
      elsif hour == 17
        seventeen += 1
      elsif hour == 18
        eighteen += 1
      elsif hour == 19
        nineteen += 1
      end

    end

      post_body = %Q{
        {
              "data":  [
                {
                  "Dashboard_id": "Call Data by Hour",
                  "7": "#{seven}",
                  "8": "#{eight}",
                  "9": "#{nine}",
                  "10": "#{ten}",
                  "11": "#{eleven}",
                  "12": "#{twelve}",
                  "1": "#{thirteen}",
                  "2": "#{fourteen}",
                  "3": "#{fifteen}",
                  "4": "#{sixteen}",
                  "5": "#{seventeen}",
                  "6": "#{eighteen}"
                }
              ],
                "onduplicate":  {
                    "8": "replace",
                    "9": "replace",
                    "10": "replace",
                    "11": "replace",
                    "12": "replace",
                    "1": "replace",
                    "2": "replace",
                    "3": "replace",
                    "4": "replace",
                    "5": "replace",
                    "6": "replace"
                }
      }
  }


      request = Typhoeus::Request.new("https://app.cyfe.com/api/push/533657cf40082803443447458823",
                                      :userpwd => "jonathanamccann@gmail.com:",
                                      :method => :post,
                                      :body => post_body,
                                      :headers => { 'Content-Type' => "application/json"}
      )
      response = request.run.body
      JSON.parse(response)
      puts response
    end






end

