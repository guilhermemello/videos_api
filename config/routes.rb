Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :videos do
        get 'mais_acessados', on: :collection
        post 'like', on: :member
        post 'dislike', on: :member
        post 'view', on: :member
        get 'search', on: :collection
        get 'relacionados', on: :member
        get 'por_disciplina', on: :collection
      end

      resources :disciplinas do
        get 'mais_acessadas', on: :collection
      end
    end
  end
end
