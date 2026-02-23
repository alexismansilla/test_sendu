FROM ruby:2.7.8

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential tzdata

# Set workspace
WORKDIR /app

# Copy lockfiles and install bundler / gems
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Fix Bundler version for compatibility with Rails 5 and Ruby 2.7
RUN gem install bundler -v 2.4.22
RUN bundle update --bundler
RUN bundle install

# Copy application files
COPY . /app

# Configure entrypoint to ensure server.pid is removed
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
