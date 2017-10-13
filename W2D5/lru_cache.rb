class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(item)
    if @cache.include?(item)
      @cache.delete(item)
      @cache << item
    elsif self.count >= @size
      @cache.shift
      @cache << item
    else
      @cache << item
    end
  end

  def show
    puts @cache
  end
end
