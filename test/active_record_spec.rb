require 'minitest/autorun'
require "./models/active_record"

describe "ActiveRecord" do
    class TestRecord < ActiveRecord; end

    describe "#save" do
        it "should add the record to the database" do
            expect(TestRecord.db.length).must_equal 0
            record = TestRecord.new
            record.save
            expect(TestRecord.db.length).must_equal 1
            record.save
            expect(TestRecord.db.length).must_equal 1
        end
    end
end

