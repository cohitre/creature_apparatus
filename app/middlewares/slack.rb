class SlackMiddleware < Sinatra::Base
  before do
    content_type :json
  end

  set :slack_token, ENV['SLACK_TOKEN']

  post '/slack/encounter' do
    halt 403 unless params[:token] == settings.slack_token

    encounter = RandomEncounter.roll_random(params['user_name'], 'slack')
    encounter.to_slack_message.to_json
  end
end
