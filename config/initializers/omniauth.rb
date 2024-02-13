Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '10195a212a78ec062b30', '774b574e4c1ede7131e1eea7e7c6fb4468df3261'
end
