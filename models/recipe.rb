require_relative "./active_record"
require_relative "./log"

class Recipe < ActiveRecord
    include Log

    DIFFICULTY_RANGE = 1..5
    DIFFICULTY_ERROR_MESSAGE = \
        "Difficulty must be between #{DIFFICULTY_RANGE.first} and #{DIFFICULTY_RANGE.last}"

    attr_reader :name, :difficulty, :errors

    def self.[](index)
        puts "Class method: #{index}"
    end

    def initialize(name: '', difficulty: 0)
        @errors = []
        self.name = name
        self.difficulty = difficulty
    end

    def difficulty=(difficulty)
        @difficulty = difficulty
        @valid_difficulty = DIFFICULTY_RANGE === @difficulty
        @errors << DIFFICULTY_ERROR_MESSAGE unless @valid_difficulty
    end

    def name=(name)
        @name = name
        @valid_name = !(@name.nil? || @name.empty?)
    end

    def valid?
        @valid_name && @valid_difficulty
    end

    def save
        super
        log "Persisted Recipe:#{@id}"
        self
    end

    def [](index)
        puts "This is great!"
    end

    def to_s
        "#{super} name:#{@name} difficulty:#{@difficulty}"
    end
end
