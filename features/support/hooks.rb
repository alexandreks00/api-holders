After do |scenario|
   if $access_token then puts "\n\nAccess Token: #{$access_token}" end
  # if @client_id then puts "\n\nClient Id: #{@client_id}" end
  # if @query then puts "\n\nQuery: #{@query.to_json}" end
  # if @headers then puts "\n\nHeaders: #{@headers.to_json}" end

  # if @response.request.http_method == Net::HTTP::Get
  #     @method = "GET"
  # elsif @response.request.http_method == Net::HTTP::Post
  #     @method = "POST"
  # elsif @response.request.http_method == Net::HTTP::Put
  #     @method = "PUT"
  # elsif @response.request.http_method == Net::HTTP::Patch
  #     @method = "PATCH"
  # else @response.request.http_method == Net::HTTP::Delete
  #     @method = "DELETE"
  # end
  # if @response then puts "\n\n#REQUEST\nMethod => #{@method},  #{@response.request.last_uri.to_s}" end 
  # # if $body then puts "\nBody Request => #{$body.to_json}" end

  # if (@response.body != nil)
  #   if @response then puts "\n\n#RESPONSE\nStatus Code => #{@response.code}\nBody Response => #{@response.body.force_encoding('UTF-8').to_json}\n\n\n" end
  # else
  #   if @response then puts "\n\n#RESPONSE\nStatus Code => #{@response.code}\nBody Response => #{@response.body.to_json}\n\n\n" end
  # end

end

require 'report_builder'
at_exit do
ReportBuilder.configure do |config|
  config.input_path = 'log/reports.json'
  config.report_path = "log/Report-#{Time.new.strftime("%Y%m%d_%H%M%S")}"
  config.report_types = [:html]
  config.report_tabs = %w[Overview Features Scenarios Errors]
  config.report_title = 'Resultado Automação API Portadores'
  config.compress_images = false
  config.additional_info = { 'API' => 'Portadores' }
end
ReportBuilder.build_report
end


