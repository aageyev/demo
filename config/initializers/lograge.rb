# config/initializers/lograge.rb
Rails.application.configure do
  config.lograge.base_controller_class = ['ActionController::API', 'ActionController::Base']
end
