#Prodction Mode下の状態
RAILS_SERVE_STATIC_FILES=true rails server -e production
#webpacker Production コンパイルできる

# Production depends on precompilation of packs prior to booting for performance.
webpacker.yml
compile: true
RAILS_ENV=staging bundle exec rails assets:precompile

# compiles in production mode by default unless NODE_ENV is specified
bundle exec rails webpacker:compile
