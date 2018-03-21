FROM ruby:2.5

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
      # For postgres gem
    libpq-dev \
      # For compilation
    nodejs \
    # Removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log


ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

LABEL maintainer="AwesomeCode <awcodify@gmail.com>"

CMD puma -C config/puma.rb