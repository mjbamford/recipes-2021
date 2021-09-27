require 'yaml'

class ActiveRecord
    class RecordNotFound < StandardError; end

    attr_reader :id

    def self.db
        @db ||= YAML.load(File.read(file_name)) rescue []
    end

    def self.file_name
        "#{self.name.downcase}.yml"
    end

    def self.all
        self.db
    end

    def self.find(id)
        record = self.db.detect { |r| r.id == id.to_i }
        raise RecordNotFound.new(id) unless record

        record
    end

    def self.save(record)
        # self is the class object ActiveRecord
        new_id = self.db.length + 1
        yield(new_id)
        self.db << record
        File.open(file_name, 'w') do |file|
            file.write(self.db.to_yaml)
        end
    end

    def save
        # self is the instance that wants to be saved
        self.class.save(self) { |id| @id = id }
        self
    end

    def self.destroy(record)
        # self = ActiveRecord
        return false if record.nil? # guard

        idx = db.index { |obj| obj.id == record.id }
        db[idx] = nil
        File.open(file_name, 'w') do |file|
            file.write(self.db.to_yaml)
        end
    end

    def destroy
        # self here is the instance
        self.class.destroy(self)
    end

    def to_s
        "identify:#{@id}"
    end
end
