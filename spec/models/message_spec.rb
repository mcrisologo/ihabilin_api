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

require 'rails_helper'

RSpec.describe Message, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
