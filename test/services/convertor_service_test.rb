require 'test_helper'

class ConvertorServiceTest < ActiveSupport::TestCase

  test "should use default params if param not provided" do
    service = ::ConvertorService.new
    service.call
    assert_equal service.from, 'USD'
    assert_equal service.to, 'INR'
    assert_equal service.value, 1
  end
end
