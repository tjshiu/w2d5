class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num] == true if is_valid?(num)
  end

  private

  def is_valid?(num)
    if num >= @store.length || num < 0
      raise "Out of bounds"
    else
      true
    end
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx] << num
  end

  def remove(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].delete(num)
  end

  def include?(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      @count += 1
      if count == num_buckets
        resize!
      end
      bucket_idx = num % num_buckets
      @store[bucket_idx] << num
    end
  end

  def remove(num)
    if include?(num)
      bucket_idx = num % num_buckets
      @store[bucket_idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_arr = Array.new(num_buckets * 2) { Array.new }
    @store.flatten.each do |el|
      bucket_idx = el % (num_buckets * 2)
      temp_arr[bucket_idx] << el
    end

    @store = temp_arr
  end
end
