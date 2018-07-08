module Ghost
  def method_missing(sym, *args)
    puts sym
  end

end

class Unstable
  def hello
    puts "Unstable#hello"
  end
end

u = Unstable.new
u.hello
begin
u.piyo # raise! NoMethodError
rescue => e
  puts e.inspect
end

Unstable.include Ghost

u.piyo

