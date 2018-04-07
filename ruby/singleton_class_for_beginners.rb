# http://magazine.rubyist.net/?0046-SingletonClassForBeginners

string_obj = 'hogepiyo'
def string_obj.destroy!
  reverse!
  upcase!
end
string_obj.destroy!
puts string_obj # 変更されている

another_string = "hogepiyo"
begin
  another_string.destroy!
rescue NoMethodError => e
  puts "error #{e}"
  puts "他のStringクラスのオブジェクトには定義されていない"
end

class Bar
  def hello
    puts "hello"
  end
end
Bar.new.hello

# これが以下とほぼ同義

Bar2 = Class.new do
  def hello
    puts "hello"
  end
end

Bar2.new.hello

def Bar2.tokui
  puts "Bar2(Classクラスのオブジェクト)の特異メソッド"
end

Bar2.tokui

class << Bar2
  def tokui2
    # 特異クラスを引き出し定義
    puts "Bar2(Classクラスのオブジェクト)の特異メソッド２"
  end
end

Bar2.tokui2

Bar2.class_eval <<-"RUBY"
  def instance1
    puts "instance method 1"
  end
RUBY

class Bar2
  def instance2
    puts "instance method 2"
  end
end

bar = Bar2.new
bar.instance1
bar.instance2

Bar2.class_eval "undef :instance2"
# bar.instance2 # No Method Error
Bar2.send(:tokui)
bar.send(:instance1)
