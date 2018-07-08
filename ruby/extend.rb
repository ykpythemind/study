
module Test
  def piyo
    puts "piyo from test"
  end
end

module Test2
  def piyo
    puts "piyo from test2"
  end
end

class Dog
  include Test
end

Dog.new.piyo

dog2 = Dog.new
dog2.extend Test2
dog2.piyo
puts dog2.class.ancestors.inspect

puts dog2.singleton_class
puts dog2.singleton_class.instance_methods.include?(:piyo)
