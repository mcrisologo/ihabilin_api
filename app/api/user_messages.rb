# frozen_string_literal: true

module UserMessages
  class API < Grape::API
    resource :message, desc: 'Message Data' do
      desc 'Get messages'
      get do
        present current_user.messages, with: Message::Entity
      end

      desc 'Create message'
      params do
        optional :recipients, type: String, desc: 'Recipients'
        optional :subject, type: String, desc: 'Subject'
        optional :body, type: String, desc: 'Body'
      end
      post do
        record = current_user.messages.create(@data)
        message_presenter(record, record.persisted?, Message::Entity)
      end

      desc 'Update message'
      params do
        requires :id, type: Integer, desc: 'Id'
        optional :recipients, type: String, desc: 'Recipients'
        optional :subject, type: String, desc: 'Subject'
        optional :body, type: String, desc: 'Body'
      end
      put do
        record = currentt_user.messages.find_by(id: @data[:id])
        not_found!('Message does not exist') unless record

        message_presenter(record, record.update(@data), Message::Entity)
      end
    end
  end
end
