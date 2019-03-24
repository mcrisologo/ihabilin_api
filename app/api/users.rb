# frozen_string_literal: true

module Users
  class API < Grape::API
    resource :user, desc: 'User Data' do
      desc 'Get user detail'
      get do
        present current_user, with: User::Entity
      end

      desc 'Update user detail'
      params do
        optional :email, type: String, desc: 'Email'
        optional :name, type: String, desc: 'Name'
      end
      put do
        message_presenter(current_user, current_user.update(@data), User::Entity)
      end

      desc 'Change user password'
      params do
        requires :current_password, type: String, desc: 'Current password'
        requires :new_password, type: String, desc: 'New password'
      end
      put :change_password do
        bad_request!('Current password is invalid') unless current_user.valid_password?(@data[:current_password])
        current_user.password = @data[:new_password]
        message_presenter(current_user, current_user.save, User::Entity)
      end
    end
  end
end
