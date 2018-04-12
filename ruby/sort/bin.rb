require 'minitest/autorun'

class Sort
  def self.bin(array)
    ar = array.each_with_object({}) do |elm, memo|
      memo[elm] ||= 0
      memo[elm] += 1
    end
    #   [1, 1, 1, 2, 3, 3, 3, 3, 3, 4, 4, 5, 5, 6]
    # ar[1] => 3
    # ar[2] => 1
    # ar[3] => 4 ...
    memo = []
    (array.min..array.max).each do |i|
      t = ar[i]
      next if t.nil?
      memo.push [i] * t # i は t 個ある
    end
    memo.flatten
  end
end

class TestSort < Minitest::Test
  def test_bin
    a = [1, 1, 1, 2, 3, 3, 3, 3, 3, 4, 4, 5, 5, 6]
    assert_equal a, Sort.bin([5, 3, 3, 4, 1, 5, 3, 2, 6, 3, 1, 3, 4, 1])
    assert_equal a, Sort.bin([3, 1, 4, 5, 5, 3, 3, 3, 2, 3, 1, 1, 6, 4])
  end
end
