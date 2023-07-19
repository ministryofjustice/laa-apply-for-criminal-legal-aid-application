Rails.application.routes.draw do
  extend RouteHelpers

  mount LaaMultiStepForms::Engine => '/laa_multi_step_forms'

  put '/dummy_step/:id/after_commit', to: 'home#index', as: :after_commit
  get '/dummy_step/:id', to: 'dummy_step#show'
  put '/dummy_step/:id', to: 'dummy_step#update'

  root 'home#index'

  scope 'applications/:id' do
    namespace :steps do
      edit_step :claim_type
      show_step :start_page
      crud_step :defendant, param: :defendant_id, except: [:destroy]
      crud_step :work_item, param: :work_item_id do
        member do
          get :duplicate
        end
      end
    end
  end
end
