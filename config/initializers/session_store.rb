# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gweathermaps_session',
  :secret      => 'b8348db35bed2865ec402958f8fc220a92862d55fcb68c37720c28e5bcba76d42196dbc0b7a8d4f4c44c145a89ec8fbe21be2706cf7fd55d2ee9ebd783419483'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
