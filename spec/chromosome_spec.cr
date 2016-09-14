require "./spec_helper"

describe GA::Chromosome do
  it "initialize a Chromosome" do
    chromosome = GA::Chromosome.new(18)
    chromosome.should be_a(GA::Chromosome)
  end

  it "contains genes" do
    chromosome = GA::Chromosome.new(18)
    chromosome.genes.should be_a(Array(Char))
    chromosome.genes.size.should eq(18)
  end

  it "does to_s" do
    chromosome = GA::Chromosome.new(18)
    chromosome.to_s.should be_a(String)
  end
end
