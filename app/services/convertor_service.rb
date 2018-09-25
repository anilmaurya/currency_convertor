class ConvertorService < BaseService

  attr_reader :from, :to, :value, :result

  validates :from, :to, :value, presence: true

  def initialize(from: 'USD', to: 'INR', value: 1)
    @from = from
    @to = to
    @value = value
  end

  def call
    valid? &&
      fetch_rates &&
      set_result
  end

  def fetch_rates
    @rates = load_rates
  end

  def set_result
    @result = @rates[to]
  end

  def update_cache
    service = ExternalApiService.new(base_currency: from)
    service.call
    service.result
  end

  def load_rates
    update_cache if !value_from_cache
    return JSON.parse(value_from_cache)
  end

  def value_from_cache
    @value_from_cache ||= REDIS.hget(from, 'rates')
  end

end
