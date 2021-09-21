class MyError < StandardError; end

def make_an_error
  # 1/0
  raise MyError.new("You enteree bad data")
rescue => e
  puts e.inspect
end

def read_database
  raise "BAD!"
end

db = read_database rescue []
puts db.inspect


