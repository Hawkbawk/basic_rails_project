FROM ruby:2.5
RUN apt-get update && apt-get install sqlite3
# Grab node from nodesource and install it.
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
# Add GPG key for installing yarn from it's repo, add it to master list, then install it.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
WORKDIR /usr/src/app/blog
CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000