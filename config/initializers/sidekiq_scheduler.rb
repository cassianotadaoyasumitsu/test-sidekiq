require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  Sidekiq::Scheduler.dynamic = true
  Sidekiq::Scheduler.enabled = true
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../../sidekiq_scheduler.yml', __FILE__))
    Sidekiq::Scheduler.reload_schedule!
  end
end
