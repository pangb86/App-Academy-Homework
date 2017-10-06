class Queue

  def initialize
    @my_queue = []
  end

  def enqueue(el)
    @my_queue.push(el)
  end

  def dequeue
    @my_queue.shift
  end

  def show
    @my_queue.dup
  end

end
