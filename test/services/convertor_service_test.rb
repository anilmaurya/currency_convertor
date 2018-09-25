require 'test_helper'

class ConvertorServiceTest < ActiveSupport::TestCase

  test "should return invalid param if param not provided" do
    service = ConvertorService.new
    service.call
    assert_equal service.result, 'invalid params'
  end
end
