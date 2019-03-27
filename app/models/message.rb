# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  recipients :text             default([]), is an Array
#  subject    :string
#  body       :text
#

class Message < ApplicationRecord
  belongs_to :user

  validates_presence_of :recipients, :subject, :body
end
