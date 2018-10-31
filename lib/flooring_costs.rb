class FlooringCosts

  require 'json'
  SETTINGS_JSON = 'floor_plans.json'

  private

  def settings
    JSON.parse(File.read(SETTINGS_JSON))
  end
end
