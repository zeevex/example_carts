# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ruby_example_session',
  :secret      => '26460ef697dec555aafe989b7c93f5b844b3a149c53e115294fdc5e049a02d35137d0d820ceb440822367dba2da89ea4d4b7052be1edc8c1e466caf88b41796c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
