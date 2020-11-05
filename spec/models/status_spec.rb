# == Schema Information
#
# Table name: statuses
#
#  id         :bigint           not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Status, type: :model do
  describe "#valid" do
    it "is invalid if status's text is blank" do
      status = Status.create!(text: "something")
      expect(status).to be_valid 

      status.text = ""
      expect(status).not_to be_valid

      status.text = nil
      expect(status).not_to be_valid
    end

  end
end
