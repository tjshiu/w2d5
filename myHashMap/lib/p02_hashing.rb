class Fixnum
  # Fixnum#hash already implemented for you
end

class Array

  def hash
    sorted_arr = []
    result = 0

    self.each do |el|
      sorted_arr << el.ord
    end

    sorted_arr.sort!

    self.each_with_index do |el, idx|
      result += (el.ord - sorted_arr[idx]).abs
    end

    result
  end

  def encode_me(el, sorted_el)
    
  end



end

class String
  def hash
    arr = self.split("")
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = self.to_a
    arr.hash || 0
  end
end
