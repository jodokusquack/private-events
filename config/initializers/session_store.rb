# add an expiry date to the session cookie

Rails.application.config.session_store :cookie_store, key: '_app_session', expire_at: nil
