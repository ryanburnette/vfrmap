require 'rspec'

module GlobalLetDeclarations
  extend RSpec::SharedContext

  let(:dd_coordinates_arr) { ['50.004444','36.231389'] }
  let(:dd_coordinates) { '50.004444,36.231389' }
  let(:invalid_coordinates) { '12345,12345' }
end
