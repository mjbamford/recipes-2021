require_relative "./active_record"

class Recipe < ActiveRecord
    attr_reader :name, :difficulty

    def initialize(name: '', difficulty: 1)
        @valid = true
        @name = name
        self.difficulty = difficulty
    end

    def difficulty=(difficulty)
        @difficulty = difficulty
        @valid = (1..5) === @difficulty
    end
    
    def name=(name)
        @name = name
        @valid = !(@name.nil? || @name.empty?)
    end

    def valid?
        @valid
    end

    def [](index)
        puts "Instance method: #{index}"
    end

    def self.[](index)
        puts "Class method: #{index}"
    end
end