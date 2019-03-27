# frozen_string_literal: true

module ApiHelpers
  module Files
    extend ::Grape::API::Helpers

    def process_file(file, record)
      return false if file.blank?

      attachment = {
        filename: file[:filename],
        type: file[:type],
        headers: file[:head],
        tempfile: file[:tempfile]
      }
      record.file = ActionDispatch::Http::UploadedFile.new(attachment)
      record.save
    end

    def destroy_file(record)
      record.file = nil
      record.save
      record.destroy
    end

    def get_uploaded_file(file)
      attachment = {
        filename: file[:filename],
        type: file[:type],
        headers: file[:head],
        tempfile: file[:tempfile]
      }
      ActionDispatch::Http::UploadedFile.new(attachment).path
    end
  end
end
