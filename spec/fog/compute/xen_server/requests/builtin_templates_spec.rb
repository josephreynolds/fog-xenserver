require 'minitest_helper'

describe "#builtin_templates" do
  let(:connection) do
    VCR.use_cassette('open_connection') do
      Fog::Compute.new(:provider => 'XenServer')
    end
  end

  it "should return all builtin templates" do
    VCR.use_cassette('builtin_templates') do
      connection.builtin_templates.size.must_equal 63
    end
  end
end