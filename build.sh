gem install bundler
bundle config set --local path './vendor/bundle'
bundle config set --local without 'development test'
bundler install
