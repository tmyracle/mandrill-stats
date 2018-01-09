require 'mandrill'

API_KEY = 'ADD API KEY HERE'
mandrill = Mandrill::API.new API_KEY

# Add the template names you want stats on to this array

templates_to_query = [
  'template-name',
]

templates_to_query.each do |template|
  begin 
    results = mandrill.templates.time_series template
    total_sent = 0
    total_unique_open = 0
    total_unique_clicks = 0
    results.each do |data|
      total_sent += data["sent"]
      total_unique_open += data["unique_opens"]
      total_unique_clicks += data["unique_clicks"]
    end
    open_rate = (total_unique_open.to_f / total_sent * 100).round(2)
    click_rate = (total_unique_clicks.to_f / total_sent * 100).round(2)
    puts "For the template #{template}: The total sent is #{total_sent}, the open rate is #{open_rate}%, and click through rate is #{click_rate}%."
  rescue Mandrill::Error => e
    puts "A mandrill error occured: #{e.class} - #{e.message}"
    raise
  end
end