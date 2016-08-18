Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '1757754367796468', '1b97fc998d83417e93f021051e428bd9'
    end