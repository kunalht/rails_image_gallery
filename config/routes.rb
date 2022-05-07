Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :galleries do
    resources :photos, controller: 'galleries/photos' do
      resources :comments, controller: 'galleries/photos/comments'
    end
  end

  resources :tags do
    get '/assign_to_gallery/:gallery_id', to: 'tags#assign_to_gallery', as: :assign_to_gallery
    get '/assign_to_photo/:photo_id', to: 'tags#assign_to_photo', as: :assign_to_photo
  end

  root to: 'galleries#index'
end
