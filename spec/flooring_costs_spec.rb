require 'flooring_costs'
require 'date'

describe FlooringCosts do
  subject do
    FlooringCosts.new(
      date_start: Date.new(2018, 10, 1),
      date_end: Date.new(2018, 10, 22),
      amount: 45_000
    )
  end

  describe '#total' do
    it 'calculates the floor cost correctly' do
      expect(subject.total).to be_within(0.01).of(103.56)
    end

    context 'a different amount uses a different interest rate' do
      subject do
        FlooringCosts.new(
          date_start: Date.new(2018, 10, 1),
          date_end: Date.new(2018, 10, 22),
          amount: 30_000
        )
      end

      it 'calculates the floor cost correctly' do
        expect(subject.total).to be_within(0.01).of(69.04)
      end
    end

    context 'Unsold vehicle has no end date (defaults to current date)' do
      subject do
        FlooringCosts.new(
          date_start: Date.today - 21,
          amount: 30_000
        )
      end

      it 'calculates the floor cost correctly' do
        expect(subject.total).to be_within(0.01).of(69.04)
      end
    end

    context 'nil financing amount' do
      subject do
        FlooringCosts.new(
          date_start: Date.new(2018, 10, 1),
          date_end: Date.new(2018, 10, 22),
          amount: nil
        )
      end

      it 'returns a floor cost of zero' do
        expect(subject.total).to be_within(0.01).of(0)
      end
    end

    context 'an amount equal to a range limit' do
      subject do
        FlooringCosts.new(
          date_start: Date.new(2018, 10, 1),
          date_end: Date.new(2018, 10, 22),
          amount: 25_000
        )
      end

      it 'calculates the floor cost correctly' do
        expect(subject.total).to be_within(0.01).of(43.15)
      end
    end

    context 'impossible date range' do
      subject do
        FlooringCosts.new(
          date_start: Date.new(2018, 10, 1),
          date_end: Date.new(2017, 10, 22),
          amount: 25_000
        )
      end

      it 'returns a floor cost of zero' do
        expect(subject.total).to be_within(0.01).of(0)
      end
    end
  end
end
