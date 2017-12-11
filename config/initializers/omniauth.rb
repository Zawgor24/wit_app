Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  callback_url: "https://glacial-sands-69857.herokuapp.com/users/auth/facebook/callback"
end