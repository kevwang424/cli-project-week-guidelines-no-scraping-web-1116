class Death

  ALL = []

  attr_accessor :year, :leading_cause, :num_of_deaths

  def initialize(year, leading_cause, num_of_deaths)
    @year = year
    @leading_cause = leading_cause
    @num_of_deaths = num_of_deaths
    ALL << self
  end

  def self.all
    ALL
  end

end
