class Stack
  def initialize
    @els = []
  end

  def add(el)
    @els.push(el)
  end

  def remove
    @els.pop
  end

  def show
    @els.dup
  end
end

class Queue
  def initialize
    @els = []
  end

  def enqueue(el)
    @els.push(el)
  end

  def dequeue
    @els.shift
  end

  def show
    @els.dup
  end
end
