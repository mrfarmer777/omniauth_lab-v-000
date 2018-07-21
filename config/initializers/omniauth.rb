#Using the OmniAuth::Builder object from the OmniAuth middleware
#I think each provider would have an additional line with the requisite name, key, and secret (links to them at least)


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']  #It's common that these evaluate to nil and stuff breaks! Watch out
end
