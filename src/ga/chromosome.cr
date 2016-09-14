class GA::Chromosome
  property genes : Array(Char)
  property fitness : Float64

  def initialize(size : Int32)
    @genes = Array(Char).new(size) { rand(32..128).chr }
    @fitness = Float64.new(0)
  end

  def crossover(partner)
    child = Chromosome.new(genes.size)
    mid_point = rand(genes.size)

    genes.each_with_index do |gene,i|
      if i > mid_point
        child.genes[i] = gene
      else
        child.genes[i] = partner.genes[i]
      end
    end
    child
  end

  def mutate(mutation_rate)
    genes.each_with_index do |e, i|
      genes[i] = rand(32..128).chr if rand < mutation_rate
    end
  end

  def fitness(target)
    score = 0
    genes.each_with_index do |gene, i|
      score += 1 if gene == target.at(i)
    end
    @fitness = (score.to_f / target.size.to_f)
  end

  def to_s
    genes.join("")
  end

end
