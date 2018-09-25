require 'test_helper'

class ConvertorServiceTest < ActiveSupport::TestCase

  test "should use default params if param not provided" do
    service = ::ConvertorService.new
    service.call
    assert_equal service.from, 'USD'
    assert_equal service.to, 'INR'
    assert_equal service.value, 1
  end

  test "should get conversion from external api" do
    service = ::ConvertorService.new(from: 'USD', to: 'INR', value: 1)
    service.call
    service.result
  end
end
