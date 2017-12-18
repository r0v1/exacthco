# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'yaml'
require 'browserstack/local'

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

# ---------------------------------------------------------------------------
# This is the configuration needed for running the Capybara rspecs in local browser.
# =begin

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Capybara.default_host = Capybara.app_host = "http://localhost:6789"
# Capybara.server_port = 6789

Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :chrome
end

# Start server before specs
Capybara.current_session

# =end
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# This is the configuration needed for running the Capybara rspecs in BrowserStack.
=begin

# monkey patch to avoid reset sessions
class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    if @browser
      @browser.navigate.to('about:blank')
    end
  end
end

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'single'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../config/browserstack/#{CONFIG_NAME}.config.yml")))
CONFIG['user'] = ENV['BROWSERSTACK_USERNAME'] || CONFIG['user']
CONFIG['key'] = ENV['BROWSERSTACK_ACCESS_KEY'] || CONFIG['key']

Capybara.register_driver :browserstack do |app|
  @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])

  # Code to start browserstack local before start of test
  if @caps['browserstack.local'] && @caps['browserstack.local'].to_s == 'true';
    @bs_local = BrowserStack::Local.new
    bs_local_args = {"key" => "#{CONFIG['key']}"}
    @bs_local.start(bs_local_args)
  end

  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => "http://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub",
    :desired_capabilities => @caps
  )
end

Capybara.configure do |config|
  config.default_driver        = :browserstack
  config.run_server            = false
end

# Code to stop browserstack local after end of test
at_exit do
  @bs_local.stop unless @bs_local.nil?
end

=end
# ---------------------------------------------------------------------------
