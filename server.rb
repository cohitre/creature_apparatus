require 'sinatra'
require 'sinatra/activerecord'
require_relative './app/middlewares/slack'
require_relative './app/models'
require_relative './app/random_encounter'

class Server < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :port, ENV['PORT'] || 4567
  set :database, ENV['DATABASE_URL']

  use SlackMiddleware
end
