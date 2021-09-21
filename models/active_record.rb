require 'yaml'

class ActiveRecord
    class RecordNotFound < StandardError; end

    attr_reader :id

    def self.db
        @db ||= (YAML.load(File.read('recipes.yml')) rescue [])
    end

    def self.all
        self.db
    end

    def self.find(id)
        record = self.db.detect { |r| r.id == id.to_i }
        raise RecordNotFound.new(id) unless record

        record
    end

    def self.save(record) # implicit block also provided
        new_id = self.db.length + 1
        yield new_id
        self.db << record
        File.open('recipes.yml', 'w') do |file|
            file.write(self.db.to_yaml)
        end
    end

    def save
        self.class.save(self) do |id|
            @id = id
        end
        self
    end

    def delete
        # Delete an instance from the db
        puts "ActiveRecord#delete"
    end
end