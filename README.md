
# Dockerizing Rails 5, Postgres, Redis, Sidekiq, ActionCable
## How to use

* clone this repository
* `cp .env.example .env` and change into yours:

```
DB_USER=root
DB_PASSWORD=itsahardpassword!
REDIS_URL=redis://redis:6379/0
REDIS_PASSWORD=itsahardpassword!
```
* docker-compose up --build
* go to `http://localhost:3000`
### Postgres

Document not created. You can see at `docker-compose.yml` to start understanding.

### Redis

Document not created. You can see at `docker-compose.yml` to start understanding.
### Sidekiq

```ruby
redis = { 
  url: (ENV['REDIS_URL'] || 'redis://127.0.0.1:6379/0'),
  password: (ENV['REDIS_PASSWORD'] || '')
}

Sidekiq.configure_server do |config|
  config.redis = redis
end

Sidekiq.configure_client do |config|
  config.redis = redis
end
```
#### Sidekiq dashboard
After `docker-compose up` you can go to `http://localhost:3000/sidekiq`
To change url into yours, go to `routes.rb` and change the path:
```ruby
mount Sidekiq::Web => '/sidekiq'
```

### ActionCable

Document not created. You can see at `docker-compose.yml` to start understanding.
