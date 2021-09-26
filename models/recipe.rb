require_relative "./active_record"

class Recipe < ActiveRecord
    attr_reader :name, :difficulty

    def self.[](index)
        puts "Class method: #{index}"
    end

    def initialize(name: '', difficulty: 0)
        @valid = false
        self.name = name
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
        puts "This is great!"
    end

    def to_s
        "#{super} name:#{@name} difficulty:#{@difficulty}"
    end
end
