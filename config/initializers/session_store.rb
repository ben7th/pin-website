# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pin-website_session',
  :secret      => 'a23c97bc0b688f17b85e9506eee4c5bae333ec76234a92d31e14a3ee092e7f6146d5c6eb8c529f32b20bace68b5de8bdeb19bf6dfeb903aaafdf7f1d97ab0527'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
