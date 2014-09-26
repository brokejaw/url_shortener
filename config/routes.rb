Urlshortener::Application.routes.draw do
  root to: "shortened_urls#root"
  resources :shortened_urls
end
