# frozen_string_literal: true

require 'date'
require 'json'

# Class to determine flooring cost
class FlooringCosts
  SETTINGS_JSON = 'floor_plans.json'
  attr_accessor :date_start, :date_end, :amount, :rates

  def initialize(date_start:, date_end: Date.today, amount:)
    @date_start = date_start
    @date_end = date_end
    @amount = amount
  end

  def total
    # Evaluate if amount and date is valid
    if @date_end > @date_start && !@amount.nil?
      # Calculation days
      days = @date_end - @date_start
      # Interest rate
      interest_rate = settings.to_f / 100
      # Total calculation
      total = @amount * (interest_rate / 365) * days.to_i
    else
      total = 0
    end

    # Return total
    total
  end

  private

  def settings
    i = 0
    @rates = JSON.parse(File.read(SETTINGS_JSON))
    while  i < @rates.length
      if (@amount >= @rates[i]['amount_low'])\
        && (@amount <= @rates[i]['amount_high'])
        return @rates[i]['interest_rate']
      end
      i += 1
    end
  end
end
