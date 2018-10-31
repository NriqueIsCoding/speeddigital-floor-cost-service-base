# Write a Service to calculate a vehicles floor cost.

https://en.wikipedia.org/wiki/Retail_floorplan

Car dealerships will take a loan out on a vehicle in their inventory and pay it off when the vehicle is sold. We need you to write up a bit of code that calculates how much the vehicle has cost them in financing fees while awaiting a sale.

Using the `lib/flooring_costs.rb` file, complete implementation of a ruby class that accepts 3 values as input and uses the json file `floor_plans.json` to calculate the proper final floor cost.

3 parameters to pass to the `FlooringCosts` class are 2 dates and financed amount. The dates are when the vehicle arrived in inventory at the dealership and the day the vehicle was sold (if sold. If not sold this date should default to current date)

The flooring cost is calculated using the equation: `financed_amount * per day interest rate * total days financed`

`$50,000 financed at 4% for 3 weeks is $115.07`

Interest rates are variable and configured in `floor_plans.json`

When your work is complete, all tests in `spec/flooring_costs_spec.rb` should pass and rubocop should report no offenses in `lib/flooring_costs.rb`

Fork this repo and commit your changes to your fork on github.

#### Usage

`bundle install`

`bundle exec rspec`

`bundle exec rubocop lib/flooring_costs.rb`

#### Extras

Rubocop details: https://github.com/rubocop-hq/ruby-style-guide
