require 'sidekiq'
require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  schedule = Sidekiq::Cron::Job.load_from_hash({})
end
