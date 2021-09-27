require_relative "./active_record"

module Log
    class Log < ActiveRecord
        attr_reader :message

        def self.file_name
            "my-log.yml"
        end

        def initialize(message)
            @message = message
        end
    end

    def log(msg)
        log = Log.new "Sumologic -> #{msg}"
        log.save
    end
end