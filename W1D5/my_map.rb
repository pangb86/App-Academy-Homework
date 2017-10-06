class MyMap

  def initialize
    @my_map = []
  end

  def assign(key, value)
    pair_idx = @my_map.index {|pair| pair[0] == key}

    if pair_idx.nil?
      @my_map[pair_index].last = value
    else
      @my_map.push([key, value])
    end

    [key, value]
  end

  def lookup(key)
    @my_map.each {|pair| return pair[1] if pair[0] == key}
    nil
  end

  def remove(key)
   @my_map.reject! {|pair| pair[0] == key}
   nil
  end

  def show
    deep_dup(@my_map)
  end

  def deep_dup(arr)
    arr.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end
  end

end
