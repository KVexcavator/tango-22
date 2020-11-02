# == Schema Information
#
# Table name: signts
#
#  id            :bigint           not null, primary key
#  activity_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  place_id      :bigint           not null
#
# Indexes
#
#  index_signts_on_place_id  (place_id)
#
# Foreign Keys
#
#  fk_rails_...  (place_id => places.id)
#
class Signt < ApplicationRecord
  belongs_to :place
end
