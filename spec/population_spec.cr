require "./spec_helper"

describe GA::Population do
  it "initialize a Population" do
    population = GA::Population.new("Target", 0.05, 2)
    population.should be_a(GA::Population)
  end

  it "calculate_fitness" do
    population = GA::Population.new("Target", 0.05, 2)
    population.population[1].genes = ['T', 'a', 'r', 'g', 'e', 't']
    population.calculate_fitness
    population.population[1].fitness.should eq(1)
  end

  it "natural_selection" do
    population = GA::Population.new("Target", 0.05, 2)
    population.population[1].genes = ['T', 'a', 'r', 'g', 'e', 't']
    population.calculate_fitness
    population.natural_selection
  end
end
