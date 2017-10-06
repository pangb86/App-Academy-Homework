class Stack

  def initialize
    @my_stack = []
  end

  def add(el)
    @my_stack.push(el)
  end

  def remove
    @my_stack.pop
  end

  def show
    @my_stack.dup
  end

end
