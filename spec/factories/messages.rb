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

FactoryBot.define do
  factory :message do
    user { "" }
    recipients { "" }
    subject { "MyString" }
    body { "MyText" }
  end
end
