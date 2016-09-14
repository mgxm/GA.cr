class GA::Population
  getter population, target, mutation_rate, size
  getter? finished, generations
  property mating_pool

  def initialize(@target : String, @mutation_rate : Float64, @size : Int32)
    @population = Array(Chromosome).new(size) { Chromosome.new(target.size)}
    @mating_pool = Array(Chromosome).new
    @finished = false
    @generations = 0
    @perfect_score = 1

    calculate_fitness
  end

  def natural_selection
    mating_pool.clear
    max_fitness = 0

    population.each do |gene|
      fitness = gene.fitness
      max_fitness = fitness if fitness > max_fitness
    end

    population.each_with_index do |gene,i|
      fitness =  gene.fitness / max_fitness
      n = (fitness * 100).to_i
      n.times do |j|
        mating_pool << population[i]
      end
    end
  end

  def generate
    population.each_with_index do |gene, i|
      partner_a = mating_pool.at(rand(mating_pool.size))
      partner_b = mating_pool.at(rand(mating_pool.size))

      offspring = partner_a.crossover(partner_b)
      offspring.mutate(mutation_rate)
      population[i] = offspring
    end
    @generations += 1
  end

  def best?
    world_record = 0.0
    index = 0
    population.each_with_index do |gene, i|
      if gene.fitness > world_record
        index = i
        world_record = gene.fitness
      end
    end

    @finished = true if world_record == @perfect_score
    population[index].to_s
  end

  def average_fitness
    total = 0
    population.each_with_index do |gene, i|
      total += gene.fitness
    end
    total / population.size
  end

  def calculate_fitness
    population.each do |chromosome|
      chromosome.fitness(target)
    end
  end

end
