Rails.application.routes.draw do
  root "courses#index"

  get "assignments", to: "assignments#index"
end