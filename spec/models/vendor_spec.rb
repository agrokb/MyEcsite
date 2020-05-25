require 'rails_helper'

RSpec.describe Vendor, type: :model do
  context "test company name" do
    it "Inputed company name" do
      vendor = Vendor.new(id:1,title: 'Hello',description: "123")
      expect(vendor).to be_valid
    end
    it "Not yet" do
      vendor = Vendor.new
      expect(vendor).not_to be_valid
    end    
  end
end
