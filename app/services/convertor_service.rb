class ConvertorService
  include ActiveModel::Validations
  attr_reader :from, :to, :value, :result

  validates :from, :to, :value, presence: true

  def initialize(from: 'USD', to: 'INR', value: 1)
    @from = from
    @to = to
    @value = value
  end

  def call
  end

end
