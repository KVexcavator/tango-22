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
require 'rails_helper'

RSpec.describe Signt, type: :model do
  describe "#valid?" do
    it "should validate activtty type correctly" do
      signt =Signt.new(place: Place.new)

      signt.activity_type = "unknown"
      expect(signt).not_to be_valid 
      ["checkin", "checkout"].each do |type|
        signt.activity_type = type
        expect(signt).to be_valid
      end
    end
  end
end

