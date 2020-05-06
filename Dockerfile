FROM ruby:2.5
RUN apt-get update && apt-get install sqlite3
# Grab node from nodesource and install it.
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
# Add GPG key for installing yarn from it's repo, add it to master list, then install it.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# Set working directory to this project.
WORKDIR /usr/src/app/blog
# Install rails and the then gems and yarn packages.
RUN apt-get update && apt-get install -y yarn
RUN gem install rails
RUN bundle install
RUN yarn install
# Create and migrate the database.
RUN echo "Creating database, this can take a minute..."
RUN bundle exec rails db:create
RUN echo "Migrating the database, this'll just take a second."
RUN bundle exec rails db:migrate
# Start up the server and expose the correct port for local development.
CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000