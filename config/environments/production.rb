require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance.
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Cache assets for far-future expiry.
  # config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.year.to_i}" }

  # Store uploaded files locally.
  config.active_storage.service = :local

  # Assume SSL termination (if using a reverse proxy).
  config.assume_ssl = true
  config.force_ssl = true

  # Skip HTTP-to-HTTPS redirect for health checks.
  # config.ssl_options = { redirect: { exclude: ->(request) { request.path == "/up" } } }

  # Log to STDOUT with request ID tagging.
  config.log_tags = [:request_id]
  config.logger = Logger.new(STDOUT)

  # Set log level (default to INFO unless overridden).
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info").to_sym

  # Silence health checks to avoid log spam.
  config.silence_healthcheck_path = "/up"

  # Don't log deprecations.
  config.active_support.report_deprecations = false

  # Use Redis for caching (recommended for production).
  config.cache_store = :redis_cache_store, { url: ENV.fetch("REDIS_URL", "redis://localhost:6379/1") }

  # Ignore email delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Mailer host for URL generation (use localhost if testing locally).
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

  # Enable locale fallbacks.
  config.i18n.fallbacks = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Limit logged attributes to only :id.
  config.active_record.attributes_for_inspect = [:id]

  # Allow requests only from localhost.
  config.hosts << "localhost"

  # Skip DNS rebinding protection for health checks.
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
