class ExternalApiService < BaseService
  attr_reader :response, :base_currency, :result

  def initialize(base_currency: 'INR')
    @base_currency = base_currency
  end

  def call
    valid? &&
      make_request &&
      update_cache &&
      set_result
  end

  def make_request
    @response = HTTP.get(CURRENCY_CONVERTER_API_URL + "?base=#{base_currency}")
  end

  def update_cache
    REDIS.hset(base_currency, 'rates', response.parse['rates'].to_json)
  end

  def set_result
    @result = response.parse
  end
end
