require "./ga/*"

module GA
  def self.run
    target = "Crystal GA"
    popmax = 900
    mutationRate = 0.03
    population = Population.new(target, mutationRate, popmax)

    until false
      population.natural_selection
      population.generate
      population.calculate_fitness
      population.best?
      puts "#{population.best?} => #{population.generations?}"

      if population.finished?
        break
      end
    end
  end
end
